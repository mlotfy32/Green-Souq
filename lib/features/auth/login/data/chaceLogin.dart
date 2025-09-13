import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:green_souq/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CachLogin {
  factory CachLogin() {
    return _instance;
  }
  CachLogin._internal();
  static final CachLogin _instance = CachLogin._internal();
  static chacheLogin({
    required String pass,
    required String phone,
    required String signInMethod,
  }) async {
    final userId = await FirebaseAuth.instance.currentUser!.uid;
    try {
      final response = await Supabase.instance.client.from('users').insert({
        "phone": phone,
        "password": pass,
        "userId": userId,
        "signInMethod": signInMethod,
      });
      Helper.FlutterToast(
        title: 'Your account is successfully created.',
        success: true,
      );
      return true;
    } catch (e) {
      log('${e}');
      Helper.FlutterToast(title: 'Login Failure', success: false);
      return false;
    }
    // Get.off(() => const Hom());
  }
}
