import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:green_souq/main.dart';
import 'package:meta/meta.dart';
part 'getlocation_state.dart';

class GetlocationCubit extends Cubit<GetlocationState> {
  GetlocationCubit() : super(GetlocationInitial());
  accessLocation() async {
    emit(GetlocationLoading());
    bool permission = await Geolocator.isLocationServiceEnabled();
    if (permission == false) {
      await Geolocator.requestPermission();
      getLocation();
    } else {
      getLocation();
    }
  }

  getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      await prefs.setString(
        PrefsKeys.location,
        '${placemarks[0].subAdministrativeArea}',
      );
      await prefs.setString(
        PrefsKeys.location,
        'Village: ${placemarks[0].locality}, Town: ${placemarks[0].subAdministrativeArea}, Country: ${placemarks[0].country}',
      );
      emit(GetlocationSuccess(town: '${placemarks[0].subAdministrativeArea}'));
      Helper.FlutterToast(
        title: 'The Location has been reached.',
        success: true,
      );
    } on Exception {
      await Geolocator.requestPermission();
      getLocation();
    }
  }
}
