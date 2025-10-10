part of 'disease_cubit.dart';

@immutable
abstract class DiseaseState {}

class DiseaseInitial extends DiseaseState {}

class DiseaseLoading extends DiseaseState {}

class DiseaseSuccess extends DiseaseState {
  final List<DiseaseEntite> disease;

  DiseaseSuccess({required this.disease});
}

class DiseaseFailure extends DiseaseState {
  final String error;

  DiseaseFailure({required this.error});
}
