import 'package:checkout_feature/core/utils/styles.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/custom_button.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/order_info_item.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
            child: SvgPicture.asset(
          'assets/icons/back_arrow_icon.svg',
          width: 24,
        )),
        title: const Text(
          'My Cart',
          style: Styles.style25,
        ),
      ),
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
            const TotalPrice(title: 'Total', value: r'$50.97',),
            const SizedBox(
              height: 24,
            ),
            const CustomButton(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
