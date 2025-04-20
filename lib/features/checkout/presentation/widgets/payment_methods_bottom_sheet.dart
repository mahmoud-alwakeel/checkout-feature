
import 'package:checkout_feature/features/checkout/presentation/widgets/custom_button_bloc_consumer.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';

class PaymentmethodsBottomSheet extends StatelessWidget {
  const PaymentmethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodsListView(),
          SizedBox(
            height: 32,
          ),
          CustomButtonBlocConsumer()
        ],
      ),
    );
  }
}
