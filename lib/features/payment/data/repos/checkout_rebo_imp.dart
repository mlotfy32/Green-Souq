import 'package:dartz/dartz.dart';
import 'package:green_souq/core/utiles/errors/failure.dart';
import 'package:green_souq/core/utiles/stripe/stripeService.dart';
import 'package:green_souq/features/payment/data/Model/payment_Intent_Input_model.dart';
import 'package:green_souq/features/payment/data/repos/checkout_repo.dart';

class CheckoutReboImp extends CheckoutRepo {
  final StripeService stripeService;

  CheckoutReboImp({required this.stripeService});

  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentEntientInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentEntientInputModel,
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
