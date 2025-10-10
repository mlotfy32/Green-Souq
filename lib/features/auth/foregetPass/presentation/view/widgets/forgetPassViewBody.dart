import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/styles/appImages.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/core/utiles/widgets/3.3%20custom_text_field.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/features/auth/foregetPass/data/sendSmsOtp.dart';
import 'package:green_souq/features/auth/foregetPass/presentation/view/widgets/customeBackRow.dart';

class ForgetPassViewBody extends StatefulWidget {
  const ForgetPassViewBody({super.key});

  @override
  State<ForgetPassViewBody> createState() => _ForgetPassViewBodyState();
}

class _ForgetPassViewBodyState extends State<ForgetPassViewBody> {
  late TextEditingController phone;
  @override
  void initState() {
    phone = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }

  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            const CustomBackRow(title: 'Forget Password'),
            Image.asset(
              AppImages.forgetPass,
              width: context.getWidth(context: context) - 100,
              height: context.getHeight(context: context) / 2.5.h,
            ),
            SizedBox(height: 10.h),
            const Text(
              'Please enter your phone numper. we will sent a code to your numper to reset your password',
            ),
            SizedBox(height: 10.h),
            Form(
              key: key,
              child: CustomTextField(
                keyboardType: TextInputType.phone,
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'phone is required';
                  } else if (text.length < 11) {
                    return 'phone can`t be less than 11 numpers';
                  }
                  return null;
                },
                controller: phone,
                prefixIcon: const Icon(Icons.phone, color: Colors.grey),
                hintText: 'Enter phone numper',
              ),
            ),
            SizedBox(height: 170.h),
            Customelinearbutton(
              onTap: () async {
                if (key.currentState!.validate()) {
                  await SendSmsOtp().sendSms(
                    phone: int.parse(phone.text),
                    reset: true,
                  );
                }
              },
              child: Text(
                'Get Otp',
                style: FontStyle.f25w500black.copyWith(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              width: double.infinity,
              height: 50.h,
              color: const Color(0xffFF01B252),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

/*
: widget.state == 'verift'
                  ? 'We have just sent a 6 digit code to your enterd numper. Enter the code below.'
                  : 
*/
