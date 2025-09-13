part of 'uplodimage_cubit.dart';

@immutable
abstract class UplodimageState {}

class UplodimageInitial extends UplodimageState {}

class UplodimageLoading extends UplodimageState {}

class UplodimageSuccess extends UplodimageState {
  final String imageUrl;

  UplodimageSuccess({required this.imageUrl});
}

class UplodimageFailure extends UplodimageState {}

class UplodimageProgress extends UplodimageState {
  final double progress;

  UplodimageProgress({required this.progress});
}
