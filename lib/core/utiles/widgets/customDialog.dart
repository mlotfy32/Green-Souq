import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:green_souq/core/utiles/styles/appImages.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/features/auth/login/presentation/view/loginView.dart';
import 'package:green_souq/features/home/presentation/view/widgets/homeTap.dart';
import 'package:lottie/lottie.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';

import '../../../main.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.isLogout,
    required this.isReset,
  });
  final bool isLogout;
  final bool isReset;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: context.getWidth(context: context) - 100,
        height: context.getHeight(context: context) / 2.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => context.navigateBack(context: context),
                icon: const Icon(Icons.close),
              ),
            ),
            isLogout
                ? const SizedBox.shrink()
                : Lottie.asset(AppImages.success, height: 150),
            Text(
              textAlign: TextAlign.center,
              isReset
                  ? 'Reset Password'
                  : isLogout
                  ? 'Confirm Logout'
                  : 'Success LogIn',
              style: FontStyle.f16w400gray,
            ),
            const SizedBox(height: 10),
            const Spacer(),
            Customelinearbutton(
              onTap: () => isReset
                  ? {
                      prefs.setBoolean(PrefsKeys.isRememberd, false),
                      Get.offAll(() => const Loginview()),
                    }
                  : isLogout
                  ? {
                      prefs.setBoolean(PrefsKeys.isRememberd, false),

                      Get.offAll(() => const Loginview()),
                    }
                  : context.navigateOffAll(
                      context: context,
                      child: const HomeTap(),
                    ),
              child: Text(
                isReset
                    ? 'Go To Login'
                    : isLogout
                    ? 'Logout'
                    : 'Go to home',
                style: FontStyle.f16w400gray.copyWith(color: Colors.white),
              ),
              width: double.infinity,
              height: 50,
              color: isLogout ? Colors.red : const Color(0xffFF01B252),
            ),
          ],
        ),
      ),
    );
  }
}
