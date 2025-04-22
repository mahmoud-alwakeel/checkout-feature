import 'dart:developer';

import 'package:checkout_feature/common/custom_button.dart';
import 'package:checkout_feature/core/utils/api_keys.dart';
import 'package:checkout_feature/features/checkout/data/items_model/item.dart';
import 'package:checkout_feature/features/checkout/data/items_model/items_model.dart';
import 'package:checkout_feature/features/checkout/data/models/amount_model.dart';
import 'package:checkout_feature/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout_feature/features/checkout/presentation/screens/thank_you_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSucces) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return ThankYouScreen();
              },
            ),
          );
        }
        if (state is PaymentFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
              ),
            ),
          );
          print(state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is PaymentLoading ? true : false,
          onTap: () {
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //   amount: '100',
            //   currency: 'USD',
            //   customerId: 'cus_SAhDO7GglOA6IH',
            // );
            // BlocProvider.of<PaymentCubit>(context).makePayment(
            //   paymentIntentInputModel: paymentIntentInputModel,
            // );
            var transactions = getTransactionData();
            executePaypalPayment(context, transactions);
          },
          title: 'continue',
        );
      },
    );
  }

  void executePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactions) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.paypalClientId,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": transactions.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactions.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionData() {
    var amount = AmountModel(
      total: '100',
      currency: 'USD',
      details: AmountDetailsModel(
        subtotal: '100',
        shipping: '0',
        shippingDiscount: 0,
      ),
    );
    List<OrderItemModel> orderItemsList = [
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: '4',
        quantity: 10,
      ),
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: '5',
        quantity: 12,
      ),
    ];

    var itemList = ItemListModel(
      items: orderItemsList,
    );
    return (amount: amount, itemList: itemList);
  }
}
