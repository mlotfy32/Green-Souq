part of 'getcategoryimages_cubit.dart';

@immutable
abstract class GetcategoryimagesState {}

class GetcategoryimagesInitial extends GetcategoryimagesState {}

class GetcategoryimagesLoading extends GetcategoryimagesState {}

class GetcategoryimagesSuccess extends GetcategoryimagesState {
  final List<ImagesEntite> images;

  GetcategoryimagesSuccess({required this.images});
}

class GetcategoryimagesFailure extends GetcategoryimagesState {
  final String error;

  GetcategoryimagesFailure({required this.error});
}
