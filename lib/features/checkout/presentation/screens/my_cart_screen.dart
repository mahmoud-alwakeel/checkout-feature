import 'package:checkout_feature/common/build_app_bar.dart';
import 'package:checkout_feature/common/custom_button.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/order_info_item.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/payment_methods_list_view.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/total_price.dart';
import 'package:flutter/material.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(child: Image.asset('assets/icons/product.png')),
            const SizedBox(
              height: 20,
            ),
            const OrderInfoItem(
              title: 'Order Subtotal',
              value: r'$42.97',
            ),
            const SizedBox(
              height: 3,
            ),
            const OrderInfoItem(
              title: 'Discount',
              value: r'$0',
            ),
            const SizedBox(
              height: 3,
            ),
            const OrderInfoItem(
              title: 'Shipping',
              value: r'$8',
            ),
            const Divider(
              height: 34,
            ),
            const TotalPrice(
              title: 'Total',
              value: r'$50.97',
            ),
            const SizedBox(
              height: 24,
            ),
            CustomButton(
              title: 'Complete Payment',
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return const PaymentDetailsScreen();
                //     },
                //   ),
                // );
                showModalBottomSheet(context: context, builder: (context) {
                  return PaymentmethodsBottomSheet();
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

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
          SizedBox(height: 32,),
          CustomButton(onTap: (){}, title: 'continue')
        ],
      ),
    );
  }
}