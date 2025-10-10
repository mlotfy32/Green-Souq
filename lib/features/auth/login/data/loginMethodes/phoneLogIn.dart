import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/features/auth/login/data/chaceLogin.dart';
import 'package:green_souq/features/auth/signUp/presentation/cubit/uplodimage/uplodimage_cubit.dart';
import 'package:green_souq/features/auth/signUp/presentation/view/widgets/personalDetails.dart';

class PhoneLogin {
  phoneLogIn({
    required String phone,
    required String pass,
    required BuildContext context,
  }) async {
    try {
      Helper.FlutterToast(title: 'Loading...', success: true);
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.verifyPhoneNumber(
        phoneNumber: '+2$phone',
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print("❌ Error: ${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) async {
          print("📩 Code sent! VerificationId: $verificationId");

          String smsCode = '286671';

          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: smsCode,
          );

          await auth.signInWithCredential(credential);
          await CachLogin.chacheLogin(
            pass: pass,
            google: false,
            phone: int.parse(phone),
            signInMethod: 'phone',
          );
          print("✅ Logged in with SMS code");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("⌛ Timeout: $verificationId");
        },
      );
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
