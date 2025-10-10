import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/core/utiles/styles/appImages.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/features/auth/foregetPass/presentation/view/widgets/customeBackRow.dart';
import 'package:green_souq/features/auth/foregetPass/presentation/view/widgets/pinCodeText.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/features/auth/foregetPass/presentation/view/widgets/resetPass.dart';

class OtpVervication extends StatefulWidget {
  const OtpVervication({
    super.key,
    required this.phone,
    required this.otp,
    required this.isLogin,
  });
  final int phone;
  final int otp;
  final bool isLogin;
  @override
  State<OtpVervication> createState() => _OtpVervicationState();
}

class _OtpVervicationState extends State<OtpVervication> {
  final key = GlobalKey<FormState>();
  late TextEditingController otpController;
  @override
  void initState() {
    otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            const CustomBackRow(title: 'Verify OTP'),
            Image.asset(
              AppImages.verify,
              width: context.getWidth(context: context) - 100,
              height: context.getHeight(context: context) / 2.5,
            ),
            const SizedBox(height: 10),
            const Text(
              'We have just sent a 6 digits code to your entered numper. Enter the code below.',
            ),
            const SizedBox(height: 20),
            Pincodetext(
              otp: widget.otp,
              Otpkey: key,
              otpController: otpController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don`t receive any code?',
                  style: FontStyle.f16w400gray,
                ),
                TextButton(onPressed: () {}, child: const Text('Resend')),
              ],
            ),
            const SizedBox(height: 120),
            Customelinearbutton(
              onTap: () async {
                if (key.currentState!.validate()) {
                  if (widget.otp == int.parse(otpController.text)) {
                    Helper.FlutterToast(title: 'OTP Verified', success: true);
                    Get.to(() => ResetPass(phone: widget.phone));
                  } else {
                    Helper.FlutterToast(title: 'Wrong OTP', success: false);
                  }
                }
              },
              child: Text(
                'Verify',
                style: FontStyle.f25w500black.copyWith(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              width: double.infinity,
              height: 50,
              color: const Color(0xffFF01B252),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
