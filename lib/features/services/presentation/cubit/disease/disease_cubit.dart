import 'package:bloc/bloc.dart';
import 'package:green_souq/features/services/domain/entites/disease_entite.dart';
import 'package:green_souq/features/services/domain/use_case/featch_disease_usecase.dart';
import 'package:meta/meta.dart';

part 'disease_state.dart';

class DiseaseCubit extends Cubit<DiseaseState> {
  final FeatchDiseaseUsecase featchDiseaseUsecase;
  DiseaseCubit(this.featchDiseaseUsecase) : super(DiseaseInitial());
  getDisease({required String image}) async {
    final result = await featchDiseaseUsecase.call(image);
    result.fold(
      (failure) {
        emit(DiseaseFailure(error: failure.message));
      },
      (success) {
        emit(DiseaseSuccess(disease: success));
      },
    );
  }
}
