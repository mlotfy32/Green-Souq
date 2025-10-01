import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:green_souq/features/services/domain/entites/images_entite.dart';
import 'package:green_souq/features/services/domain/use_case/featch_image_use_case.dart';
import 'package:meta/meta.dart';

part 'getcategoryimages_state.dart';

class GetcategoryimagesCubit extends Cubit<GetcategoryimagesState> {
  final FeatchImageUseCase featchImageUseCase;
  GetcategoryimagesCubit(this.featchImageUseCase)
    : super(GetcategoryimagesInitial());
  getImages({required String search}) async {
    emit(GetcategoryimagesLoading());
    search = search == 'Machinery' ? 'Machinery Farm' : search;
    search = search == 'Worker' ? 'Workers Farm' : search;
    search = search == 'Hire Worker' ? 'Hire Farm Workers' : search;
    log('search $search');
    final result = await featchImageUseCase.call(search);
    result.fold(
      (failure) {
        emit(GetcategoryimagesFailure(error: failure.message));
      },
      (success) {
        emit(GetcategoryimagesSuccess(images: success));
      },
    );
  }
}
