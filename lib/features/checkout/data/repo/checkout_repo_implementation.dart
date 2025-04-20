import 'package:checkout_feature/core/errors/failures.dart';
import 'package:checkout_feature/core/utils/stripe_service.dart';
import 'package:checkout_feature/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_feature/features/checkout/data/repo/checkout_repo.dart';
import 'package:dartz/dartz.dart';

class CheckoutRepoImplementation extends CheckoutRepo {
  final StripeService service = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await service.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
