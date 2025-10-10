import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_amout_state.dart';

class ChangeAmoutCubit extends Cubit<ChangeAmoutState> {
  ChangeAmoutCubit() : super(ChangeAmoutInitial());
  var amount;
  changeAmount({required int count}) {
    amount = count;
    emit(ChangeAmout());
  }
}
