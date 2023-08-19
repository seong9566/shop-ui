import 'package:custom_shop/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CustomShop());
}

class CustomShop extends StatelessWidget {
  const CustomShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
