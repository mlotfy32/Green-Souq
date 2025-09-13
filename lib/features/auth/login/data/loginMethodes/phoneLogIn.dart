import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneLogin {
  phoneLogIn() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: '+201275348383',
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        print("✅ Logged in automatically");
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
        print("✅ Logged in with SMS code");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("⌛ Timeout: $verificationId");
      },
    );
  }
}
