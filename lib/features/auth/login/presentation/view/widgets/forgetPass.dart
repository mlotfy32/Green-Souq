import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/features/auth/foregetPass/presentation/view/forgetPassView.dart';
import 'package:green_souq/main.dart';

class Forgetpass extends StatefulWidget {
  const Forgetpass({super.key});

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) async {
            isChecked = value!;
            await prefs.setBoolean(PrefsKeys.isRememberd, value);
            setState(() {
              prefs.setBoolean(PrefsKeys.isRememberd, value);
            });
          },
        ),
        SizedBox(width: 10.w),
        const Text('Remember Me', style: FontStyle.f16w400gray),
        const Spacer(),
        TextButton(
          onPressed: () {
            context.navigateTo(context: context, child: const ForgetPassView());
          },
          child: Text(
            'Forget Password?',
            style: FontStyle.f11w400grey.copyWith(
              color: const Color(0xffFF01B252),
            ),
          ),
        ),
      ],
    );
  }
}
