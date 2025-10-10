import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green_souq/features/auth/login/presentation/view/loginView.dart';
import 'package:green_souq/features/home/presentation/view/home_view.dart';
import 'package:green_souq/main.dart';

class GreenSouq extends StatelessWidget {
  const GreenSouq({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(home: child);
      },
      child: FirebaseAuth.instance.currentUser == null
          ? const Loginview()
          : isRemembered == null || isRemembered == false
          ? const Loginview()
          : const HomeView(),
    );
  }
}
