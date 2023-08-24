import 'package:custom_shop/constants.dart';
import 'package:custom_shop/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'cart_detailsview_card.dart';

class CartDetailView extends StatelessWidget {
  const CartDetailView({required this.controller, super.key});

  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cart",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ...List.generate(controller.cart.length, (index) => CartDetailsViewCard(productItem: controller.cart[index], controller: controller)),
            const SizedBox(
              height: defaultPadding,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Next - \$30"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
