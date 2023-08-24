import 'package:custom_shop/models/Product.dart';
import 'package:custom_shop/models/ProductItem.dart';
import 'package:flutter/material.dart';

enum HomeState { normal, cart }

class HomeController extends ChangeNotifier {
  HomeState homeState = HomeState.normal;

  List<ProductItem> cart = [];

  void changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }

  void addProductToCart(Product product) {
    for (ProductItem item in cart) {
      // 같은 그림일 경우 갯수 ++
      if (item.product!.title == product.title) {
        item.increment();
        notifyListeners();
        return;
      }
    }
    cart.add(ProductItem(product: product));
    notifyListeners();
  }

  /// fold : 누적된 값을 계산하는 역할.
  /// cart의 값을 0부터 계산한다
  /// 예로 들어 이전에 cart에 1을 넣어두었다.
  /// 새로 1개를 추가를 하면 값이 2로 되도록 하는 역할.
  int totalCartItems() => cart.fold(0, (previousValue, element) => previousValue + element.quantity);
}
