import 'package:get/get.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:green_souq/main.dart';

class CashLocation {
  cashLocation({required String location}) async {
    try {
      await prefs.setString(PrefsKeys.location, location);
      Helper.FlutterToast(
        title: 'The Location has been reached.',
        success: true,
      );
      Get.back();
    } on Exception catch (e) {
      Helper.FlutterToast(title: e.toString(), success: false);
    }
  }
}
