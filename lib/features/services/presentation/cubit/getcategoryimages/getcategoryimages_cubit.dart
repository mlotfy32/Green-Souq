import 'package:bloc/bloc.dart';
import 'package:green_souq/core/utiles/services/dio/apiService.dart';
import 'package:green_souq/features/services/data/imagesModel.dart';
import 'package:meta/meta.dart';

part 'getcategoryimages_state.dart';

class GetcategoryimagesCubit extends Cubit<GetcategoryimagesState> {
  GetcategoryimagesCubit() : super(GetcategoryimagesInitial());
  getImages({required String search}) async {
    emit(GetcategoryimagesLoading());
    search = search == 'Machinery' ? 'Machinery Farm' : search;
    search = search == 'Hire Worker' ? 'Hire Farm Workers' : search;

    final result = await Apiservice.preferences.getImages(search: search);
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
