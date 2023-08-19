import 'package:custom_shop/constants.dart';
import 'package:custom_shop/controllers/home_controller.dart';
import 'package:custom_shop/models/Product.dart';
import 'package:custom_shop/screens/components/home_header.dart';
import 'package:custom_shop/screens/components/product_card.dart';
import 'package:flutter/material.dart';

/**
 * LayoutBuilder란?
 * - 반응형 레이아웃을 위한 위젯.
 * - 화면의 크기에 따라 위젯의 크기가 알맞게 배치되도록 해준다.
 * - constraints.maxHeight : 부모위젯에서 제공되는 최대 높이
 * 
 * 
 * GestureDetector란?
 * 사용자의 움직임을 감지 하는 위젯, 즉 유저들과 상호작용 하는 가장 순수한 방법
 * 
 */
// ignore: prefer_const_constructors
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = HomeController();
  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      // 장바구니에 추가된 상품이 State가 된다.
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false, // 하단 패딩을 제거해서 하단 homeBar와 겹치지 않도록 함.
        child: Container(
          color: Color(0xFFEAEAEA),
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      AnimatedPositioned(
                        duration: panelTransition,
                        top: controller.homeState == HomeState.normal
                            ? headerHeight
                            : -(constraints.maxHeight -
                                cartBarHeight * 2 -
                                headerHeight),
                        left: 0,
                        right: 0,
                        // header의 높이, cartBar의 높이를 뺀 나머지 공간을 GridView 공간으로 활용.
                        height: constraints.maxHeight -
                            headerHeight -
                            cartBarHeight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(defaultPadding * 1.5),
                                  bottomRight:
                                      Radius.circular(defaultPadding * 1.5))),
                          child: GridView.builder(
                            itemCount: demo_products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              // 2개씩
                              crossAxisCount: 2,
                              // 각 아이템의 가로,세로 비율, 1보다 크다면 가로다 더 긴 아이템, 현재는
                              childAspectRatio: 0.75,
                              //세로 방향 아이템의 사이 간격
                              mainAxisSpacing: defaultPadding,
                              //가로 방향 아이템의 사이 간격
                              crossAxisSpacing: defaultPadding,
                            ),
                            itemBuilder: ((context, index) => ProductCard(
                                product: demo_products[index], press: () {})),
                          ),
                        ),
                      ),
                      //Card Panel
                      AnimatedPositioned(
                        duration: panelTransition,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: controller.homeState == HomeState.normal
                            ? cartBarHeight
                            : (constraints.maxHeight - cartBarHeight),
                        child: GestureDetector(
                          //onVerticalDragUpdate : 사용자가 수직으로 드래그한 이벤트
                          onVerticalDragUpdate: (details) {
                            //primaryDelta는 수직 이동거리를 나타내는 속성
                            print(details.primaryDelta);
                            _onVerticalGesture(details);
                          },
                          child: Container(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      //Header
                      AnimatedPositioned(
                        duration: panelTransition,
                        top: controller.homeState == HomeState.normal
                            ? 0
                            : -headerHeight,
                        right: 0,
                        left: 0,
                        height: headerHeight,
                        child: HomeHeader(),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
