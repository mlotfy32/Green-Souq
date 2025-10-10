import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Helper {
  factory Helper() {
    return _help;
  }
  Helper._internal();
  static final Helper _help = Helper._internal();

  static FlutterToast({required String title, required bool success}) {
    Fluttertoast.showToast(
      msg: title.tr,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: success == false ? Colors.red : Colors.greenAccent,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static customeLoadingwidget({required double size}) {
    return Get.dialog(
      Center(
        child: LoadingAnimationWidget.fourRotatingDots(
          color: Colors.blue,
          size: size,
        ),
      ),
    );
  }

  static customeLoadingDialog({required double size}) {
    return Get.defaultDialog(
      title: '',
      backgroundColor: Colors.white,
      content: CustomLoadingDialog(size: size),
    );
  }
}
