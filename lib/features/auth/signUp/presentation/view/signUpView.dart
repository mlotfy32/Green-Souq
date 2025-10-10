import 'package:flutter/material.dart';
import 'package:green_souq/features/auth/login/presentation/view/widgets/loginViewBody.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginViewBody(isLogin: false);
  }
}
