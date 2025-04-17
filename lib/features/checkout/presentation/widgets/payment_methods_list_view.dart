import 'package:checkout_feature/features/checkout/presentation/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsItems = const [
    'assets/icons/card_icon.svg',
    'assets/icons/paypal_icon.svg',
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SizedBox(
        height: 65,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: paymentMethodsItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsetsDirectional.only(end: 12.0),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    activeIndex = index;
                  });
                },
                child: PaymentMethodItem(
                  isActive: activeIndex == index,
                  image: paymentMethodsItems[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
