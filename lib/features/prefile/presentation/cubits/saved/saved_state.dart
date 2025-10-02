part of 'saved_cubit.dart';

@immutable
abstract class SavedState {}

class SavedInitial extends SavedState {}

class SavedLoading extends SavedState {}

class SavedEmpty extends SavedState {}

class AddToSaved extends SavedState {}

class SavedSuccess extends SavedState {
  final List<SavedModel> data;

  SavedSuccess({required this.data});
}

class SavedFailure extends SavedState {
  final String error;

  SavedFailure({required this.error});
}
