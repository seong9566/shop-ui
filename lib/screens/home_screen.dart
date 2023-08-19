import 'package:custom_shop/screens/components/home_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Color(0xFFEAEAEA),
        child: HomeHeader(),
      ),
    );
  }
}
