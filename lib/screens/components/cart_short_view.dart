import 'package:custom_shop/constants.dart';
import 'package:custom_shop/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class CartShortView extends StatelessWidget {
  const CartShortView({required this.controller, super.key});

  final HomeController controller; //ViewModel과 같은 역할.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          Text(
            "Cart",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            width: defaultPadding,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  controller.cart.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: defaultPadding / 2),
                    child: Hero(
                      tag: "${controller.cart[index].product!.title!}_cartTag",
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(controller.cart[index].product!.image!),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              controller.totalCartItems().toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
