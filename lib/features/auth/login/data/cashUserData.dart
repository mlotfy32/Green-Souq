import 'package:green_souq/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:green_souq/main.dart';

class CashUserData {
  cashUserData({
    required String name,
    required int phone,
    required String image,
    required String address,
    required int postCode,
  }) async {
    await prefs.setString(PrefsKeys.userName, name);
    await prefs.setString(PrefsKeys.userPhone, phone.toString());
    await prefs.setString(PrefsKeys.userImage, image);
    await prefs.setString(PrefsKeys.userAddress, address);
    await prefs.setInt(PrefsKeys.userPostCode, postCode);
  }
}
