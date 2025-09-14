import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green_souq/call.dart';
import 'package:green_souq/features/auth/login/presentation/view/loginView.dart';
import 'package:green_souq/features/home/presentation/cubits/changetap/changetap_cubit.dart';
import 'package:green_souq/features/home/presentation/view/homeViewBody.dart';

class GreenSouq extends StatelessWidget {
  const GreenSouq({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(home: child);
      },
      child: BlocProvider<ChangetapCubit>(
        create: (context) => ChangetapCubit(),
        child: const HomeViewBody(),
      ),
      // child: VoiceCallPage(role: 'caller'),
    );
  }
}
