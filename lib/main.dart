import 'package:checkout_feature/features/checkout/presentation/screens/my_cart_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckoutFeatureApp());
}

class CheckoutFeatureApp extends StatelessWidget {
  const CheckoutFeatureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCartScreen(),
    );
  }
}