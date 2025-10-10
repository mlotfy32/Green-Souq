import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/features/auth/signUp/presentation/cubit/uplodimage/uplodimage_cubit.dart';
import 'package:green_souq/features/auth/signUp/presentation/view/widgets/personalDetails.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CachLogin {
  factory CachLogin() {
    return _instance;
  }
  CachLogin._internal();
  static final CachLogin _instance = CachLogin._internal();
  static chacheLogin({
    required String pass,
    required bool google,
    required int phone,
    required String signInMethod,
  }) async {
    final userId = await FirebaseAuth.instance.currentUser!.uid;
    log(userId);
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
      Get.off(
        () => BlocProvider<UplodimageCubit>(
          create: (context) => UplodimageCubit(),
          child: PersonalDetails(phone: phone, google: google),
        ),
      );
    } catch (e) {
      log(e.toString());
      Helper.FlutterToast(title: 'Failed to create account', success: false);
    }
  }
}
