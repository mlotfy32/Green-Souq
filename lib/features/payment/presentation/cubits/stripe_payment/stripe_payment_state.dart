part of 'stripe_payment_cubit.dart';

@immutable
abstract class StripePaymentState {}

class StripePaymentInitial extends StripePaymentState {}

class StripePaymentLoading extends StripePaymentState {}

class StripePaymentSuccess extends StripePaymentState {
  final int amount;

  StripePaymentSuccess({required this.amount});
}

class StripePaymentFailure extends StripePaymentState {
  final String error;

  StripePaymentFailure({required this.error});
}
