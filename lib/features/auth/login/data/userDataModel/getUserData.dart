import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/features/auth/foregetPass/data/sendSmsOtp.dart';
import 'package:green_souq/features/auth/login/data/cashUserData.dart';
import 'package:green_souq/features/auth/login/data/userDataModel/userModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetUserData {
  getUserData({
    required int phone,
    required BuildContext context,
    required String pass,
  }) async {
    Helper.customeLoadingDialog(size: 50);
    final data = await Supabase.instance.client
        .from('users')
        .select('phone,name,password,image,address,postCode')
        .eq('phone', phone);
    if (data.isEmpty) {
      Get.back();
      Helper.FlutterToast(
        title: 'There is no user with this phone number',
        success: false,
      );
    } else {
      UserModel userData;
      userData = UserModel.fromJson(data[0]);
      await CashUserData().cashUserData(
        name: userData.name,
        phone: userData.phone,
        image: userData.image,
        address: userData.address,
        postCode: userData.postCode,
      );
      if (userData.password == pass) {
        await SendSmsOtp().sendSms(phone: phone, reset: false);
      } else {
        Get.back();
        Helper.FlutterToast(
          title: 'Wrong phone number or password',
          success: false,
        );
      }
    }
  }
}
