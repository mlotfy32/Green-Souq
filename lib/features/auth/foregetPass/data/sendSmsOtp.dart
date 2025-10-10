import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/features/auth/foregetPass/presentation/view/widgets/otpVervication.dart';
import 'package:green_souq/features/home/presentation/view/home_view.dart';

class SendSmsOtp {
  Future<void> sendSms({required int phone, required bool reset}) async {
    int otp = 684622;
    final _API_KEY_SMS = await dotenv.env['API_KEY_SMS'];
    final _API_SECRET_SMS = await dotenv.env['API_SECRET_SMS'];
    final _API_URL_SMS = await dotenv.env['API_URL_SMS'];
    final apiKey = "$_API_KEY_SMS";
    final apiSecret = "$_API_SECRET_SMS";
    final to = "2$phone";
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

      log(otp.toString());
      if (reset == true) {
        Helper.FlutterToast(title: 'Otp Sent Successfully', success: true);

        Get.to(() => OtpVervication(isLogin: true, otp: otp, phone: phone));
      } else {
        Helper.FlutterToast(title: 'Success Login', success: true);
        Get.offAll(() => const HomeView());
      }
    } catch (e) {
      Helper.FlutterToast(
        title: 'Something went wrong please try again',
        success: false,
      );
    }
  }
}
