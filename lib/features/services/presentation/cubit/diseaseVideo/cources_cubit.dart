import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/features/services/domain/entites/disease_video_entite.dart';
import 'package:green_souq/features/services/domain/use_case/featch_disease_video_use_case.dart';
import 'package:meta/meta.dart';

part 'cources_state.dart';

class CourcesCubit extends Cubit<CourcesState> {
  CourcesCubit(this.featchDiseaseVideoUseCase) : super(CourcesInitial());
  final FeatchDiseaseVideoUseCase featchDiseaseVideoUseCase;
  getDiseaseName({required String diseaseName}) async {
    emit(CourcesLoading());

    final result = await featchDiseaseVideoUseCase.call(
      diseaseName: diseaseName,
    );
    result.fold(
      (failure) {
        emit(CourcesFailure(error: failure.message));
      },
      (success) {
        emit(CourcesSuccess(cources: success));
      },
    );
  }
}
