part of 'addtocart_cubit.dart';

@immutable
abstract class AddtocartState {}

class AddtocartInitial extends AddtocartState {}

class AddtocartEmpty extends AddtocartState {}

class AddtocartLoading extends AddtocartState {}

class AddtocartSuccess extends AddtocartState {
  final List<CartModel> data;

  AddtocartSuccess({required this.data});
}

class AddtocartFailure extends AddtocartState {
  final String error;

  AddtocartFailure({required this.error});
}
