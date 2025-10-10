import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/styles/appImages.dart';
import 'package:green_souq/core/utiles/widgets/3.3%20custom_text_field.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/features/auth/foregetPass/data/reset_password.dart';
import 'package:green_souq/features/auth/foregetPass/presentation/view/widgets/customeBackRow.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({super.key, required this.phone});
  final int phone;
  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  final key = GlobalKey<FormState>();
  late TextEditingController pass1;
  late TextEditingController pass2;
  @override
  void initState() {
    pass1 = TextEditingController();
    pass2 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    pass1.dispose();
    pass2.dispose();
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
            const CustomBackRow(title: 'Reset Password'),
            Image.asset(
              AppImages.resetPass,
              width: context.getWidth(context: context) - 100,
              height: context.getHeight(context: context) / 2.5,
            ),
            const SizedBox(height: 10),
            const Text('Use at least 8 characters strong password'),
            const SizedBox(height: 10),
            Form(
              key: key,
              child: SizedBox(
                height: context.getHeight(context: context) / 3,
                child: Column(
                  children: [
                    CustomTextField(
                      obscureText: true,

                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'password is required';
                        } else if (text.length < 8) {
                          return 'password can`t be less than 8 numpers';
                        }
                        return null;
                      },
                      controller: pass1,
                      suffixIcon: const Icon(
                        size: 20,

                        FontAwesomeIcons.eyeSlash,
                        color: Colors.grey,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_open,
                        color: Colors.grey,
                      ),
                      hintText: 'Enter new password',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      obscureText: true,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'password is required';
                        } else if (text != pass1.text) {
                          return 'password not match';
                        }
                        return null;
                      },
                      suffixIcon: const Icon(
                        FontAwesomeIcons.eyeSlash,
                        size: 20,
                        color: Colors.grey,
                      ),
                      controller: pass2,
                      prefixIcon: const Icon(
                        Icons.lock_open,
                        color: Colors.grey,
                      ),
                      hintText: 'Re enter new password',
                    ),
                  ],
                ),
              ),
            ),
            Customelinearbutton(
              onTap: () async {
                if (key.currentState!.validate()) {
                  ResetPassword().resetPass(
                    phone: widget.phone,
                    newPass: pass1.text,
                  );
                }
              },
              child: Text(
                'Reset',
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
