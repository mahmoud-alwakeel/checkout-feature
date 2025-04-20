import 'package:checkout_feature/core/utils/api_keys.dart';
import 'package:checkout_feature/features/checkout/presentation/screens/my_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
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
