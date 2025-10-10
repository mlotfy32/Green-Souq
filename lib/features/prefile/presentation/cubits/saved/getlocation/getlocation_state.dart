part of 'getlocation_cubit.dart';

@immutable
abstract class GetlocationState {}

class GetlocationInitial extends GetlocationState {}

class GetlocationLoading extends GetlocationState {}

class GetlocationSuccess extends GetlocationState {
  final String town;

  GetlocationSuccess({required this.town});
}

class GetlocationLatLong extends GetlocationState {
  final Position position;

  GetlocationLatLong({required this.position});
}

class GetlocationFailure extends GetlocationState {}
