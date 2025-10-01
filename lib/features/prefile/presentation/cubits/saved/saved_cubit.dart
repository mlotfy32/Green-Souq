import 'package:bloc/bloc.dart';
import 'package:green_souq/core/utiles/constanse.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/features/prefile/data/models/saved_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedInitial());

  getSaved() async {
    emit(SavedLoading());
    Box<SavedModel> savedModel = await Hive.box(Constanse.kSavedBox);
    try {
      List<SavedModel> saved = await savedModel.values.toList();
      if (saved.isEmpty) {
        emit(SavedEmpty());
      } else {
        emit(SavedSuccess(data: saved.reversed.toList()));
      }
    } catch (e) {
      emit(SavedFailure(error: e.toString()));
    }
  }

  addToSaved({required SavedModel save}) async {
    try {
      Box<SavedModel> saveModel = await Hive.box(Constanse.kSavedBox);
      saveModel.add(save);
      Helper.FlutterToast(title: 'Saved ✅', success: true);
    } on Exception catch (e) {
      Helper.FlutterToast(title: '$e', success: false);
    }
  }
}
