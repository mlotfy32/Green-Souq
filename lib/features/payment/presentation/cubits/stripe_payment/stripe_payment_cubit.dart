import 'package:bloc/bloc.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/features/payment/data/Model/payment_Intent_Input_model.dart';
import 'package:green_souq/features/payment/data/repos/checkout_rebo_imp.dart';
import 'package:meta/meta.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.checkoutRepo) : super(StripePaymentInitial());
  final CheckoutReboImp checkoutRepo;
  stripePayment({
    required PaymentIntentInputModel paymentEntientInputModel,
  }) async {
    emit(StripePaymentLoading());
    final result = await checkoutRepo.makePayment(
      paymentEntientInputModel: paymentEntientInputModel,
    );
    result.fold(
      (failure) {
        emit(StripePaymentFailure(error: failure.message));
      },
      (success) {
        emit(StripePaymentSuccess(amount: paymentEntientInputModel.amount));
      },
    );
  }
}
