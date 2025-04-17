import 'package:checkout_feature/common/build_app_bar.dart';
import 'package:checkout_feature/common/custom_button.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/custom_credit_card.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Payment Details'),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: PaymentMethodsListView(),
          ),
          SliverToBoxAdapter(
            child: CustomCreditCard(
              formKey: formKey,
              autovalidateMode: autovalidateMode,
            ),
          ),
          SliverFillRemaining(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0, left: 12.0, right: 12.0),
                child: CustomButton(
                  title: 'Pay',
                  onTap: () {
                    if (formKey.currentState!.validate()){
                      formKey.currentState!.save();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {
                        
                      });
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
