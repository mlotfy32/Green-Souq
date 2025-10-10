import 'package:dartz/dartz.dart';
import 'package:green_souq/core/utiles/errors/failure.dart';
import 'package:green_souq/features/payment/data/Model/payment_Intent_Input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentEntientInputModel,
  });
}
