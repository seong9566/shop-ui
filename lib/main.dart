import 'package:custom_shop/constants.dart';
import 'package:custom_shop/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CustomShop());
}

class CustomShop extends StatelessWidget {
  const CustomShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            shape: const StadiumBorder(),
            backgroundColor: primaryColor,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
