import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/features/auth/foregetPass/data/generateOtp.dart';
import 'package:green_souq/features/auth/foregetPass/presentation/view/widgets/otpVervication.dart';
import 'package:green_souq/features/auth/foregetPass/presentation/view/widgets/resetPass.dart';

class SendSmsOtp {
  Future<void> sendSms({
    required int phone,
    required bool reset,
    required BuildContext context,
  }) async {
    int otp = GenerateOtp.otp.generateRandomNumber(6);
    final _API_KEY_SMS = await dotenv.env['API_KEY_SMS'];
    final _API_SECRET_SMS = await dotenv.env['API_SECRET_SMS'];
    final _API_URL_SMS = await dotenv.env['API_URL_SMS'];
    log('20$phone');
    final apiKey = "$_API_KEY_SMS";
    final apiSecret = "$_API_SECRET_SMS";
    final to = "201275348383";
    final from = "Green Souq";
    final text = "رمز التحقق الخاص بك هو $otp";

    final dio = Dio();

    try {
      final response = await dio.post(
        "$_API_URL_SMS",
        data: {
          "api_key": apiKey,
          "api_secret": apiSecret,
          "to": to,
          "from": from,
          "text": text,
        },
        options: Options(
          headers: {"Content-Type": "application/x-www-form-urlencoded"},
        ),
      );
      Get.back();

      Helper.FlutterToast(title: 'Otp Sent Successfully', success: true);
      log(otp.toString());
      if (reset == true) {
        Get.to(
          () => const ResetPass(),
        ); // context.navigateOff(context: context, child: const ResetPass());
      } else {
        Get.back();

        Get.off(() => OtpVervication(otp: otp, phone: phone, isLogin: false));
        // context.navigateTo(
        //   context: context,
        //   child: OtpVervication(otp: otp, phone: phone),
        // );
      }
    } catch (e) {
      Helper.FlutterToast(
        title: 'Something went wrong please try again',
        success: false,
      );
    }
  }
}
