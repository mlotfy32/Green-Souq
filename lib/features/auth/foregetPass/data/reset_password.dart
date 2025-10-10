import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/core/utiles/widgets/customDialog.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ResetPassword {
  resetPass({required int phone, required String newPass}) async {
    try {
      await Supabase.instance.client
          .from('users')
          .update({'password': newPass})
          .eq('phone', phone);
      Get.defaultDialog(
        content: const CustomDialog(isLogout: false, isReset: true),
        title: '',
        backgroundColor: Colors.white,
      );
      Helper.FlutterToast(
        title: 'Password Updated Successfully',
        success: true,
      );
    } on Exception catch (e) {
      Helper.FlutterToast(title: 'Something went wrong', success: false);
    }
  }
}
