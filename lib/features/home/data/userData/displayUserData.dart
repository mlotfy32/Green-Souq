import 'package:green_souq/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:green_souq/main.dart';

class DisplayUserData {
  getUserData() {
    final name = prefs.getString(PrefsKeys.userName);
    return name == null ? 'Mhmd' : name;
    //TODO:GetData
    // final phone = await prefs.getInt(PrefsKeys.userPhone);
    // final name = await prefs.getString(PrefsKeys.userName);
    // final name = await prefs.getString(PrefsKeys.userName);
  }
}
