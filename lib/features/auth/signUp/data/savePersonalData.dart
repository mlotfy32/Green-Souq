import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/features/auth/login/presentation/view/loginView.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SavePersonalData {
  saveData({
    required String image,
    required String name,
    required String address,
    required int postCode,
    required int phone,
  }) async {
    try {
      final response = await Supabase.instance.client
          .from('users')
          .update({
            "image": image,
            "name": name,
            "address": address,
            "postCode": postCode,
          })
          .eq('userId', FirebaseAuth.instance.currentUser!.uid);
      Helper.FlutterToast(title: 'Account Created Let`s LogIn', success: true);
      Get.offAll(() => const Loginview());
    } catch (e) {
      log('$e');
      Helper.FlutterToast(title: 'Failed to save data', success: false);
    }
  }
}
