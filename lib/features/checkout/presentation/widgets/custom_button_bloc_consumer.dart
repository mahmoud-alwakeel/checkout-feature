import 'package:checkout_feature/common/custom_button.dart';
import 'package:checkout_feature/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_feature/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout_feature/features/checkout/presentation/screens/thank_you_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
              amount: '100',
              currency: 'USD',
              customerId: 'cus_SAhDO7GglOA6IH',
            );
            BlocProvider.of<PaymentCubit>(context).makePayment(
              paymentIntentInputModel: paymentIntentInputModel,
            );
          },
          title: 'continue',
        );
      },
    );
  }
}
