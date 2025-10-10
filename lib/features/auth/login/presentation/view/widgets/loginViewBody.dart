import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/styles/appImages.dart';
import 'package:green_souq/features/auth/login/data/loginMethodes/signIn_Facebook.dart';
import 'package:green_souq/features/auth/login/data/loginMethodes/signIn_Google.dart';
import 'package:green_souq/features/auth/login/presentation/cubit/passwordvisability/passwordvisability_cubit.dart';
import 'package:green_souq/features/auth/login/presentation/view/loginView.dart';
import 'package:green_souq/features/auth/login/presentation/view/widgets/authButton.dart';
import 'package:green_souq/features/auth/login/presentation/view/widgets/customeLoginForm.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/features/auth/login/presentation/view/widgets/forgetPass.dart';
import 'package:green_souq/features/auth/signUp/presentation/view/signUpView.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key, required this.isLogin});
  final bool isLogin;
  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    phone.dispose();
    confirmPass.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Image.asset(
                widget.isLogin ? AppImages.login : AppImages.signUp,
                width: context.getWidth(context: context) - 100,
                height: context.getHeight(context: context) / 3,
              ),
            ),
            SliverToBoxAdapter(
              child: BlocProvider<PasswordvisabilityCubit>(
                create: (context) => PasswordvisabilityCubit(),
                child: CustomeLoginForm(
                  phone: phone,
                  pass: pass,
                  formKey: formKey,
                  isLogin: widget.isLogin,
                  confirmPass: confirmPass,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: widget.isLogin
                  ? const Forgetpass()
                  : const SizedBox.shrink(),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '----------------------------- ',
                      style: FontStyle.f11w400grey,
                    ),
                    Text(
                      widget.isLogin ? 'Or SignIn' : 'Or LogIn',
                      style: FontStyle.f16w400gray,
                    ),
                    const Text(
                      ' -----------------------------',
                      style: FontStyle.f11w400grey,
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: AppImages.authMethods.asMap().entries.map((val) {
                  return InkWell(
                    onTap: () async {
                      if (val.key == 0) {
                        await SigninWitgGoogle().signInWithGoogle();
                      } else {
                        await SigninWithFacebook().signInWithFacebook();
                      }
                    },
                    child: AuthButton(
                      title: val.key == 0 ? 'Google' : 'Facebook',
                      image: AppImages.authMethods[val.key],
                    ),
                  );
                }).toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.isLogin
                        ? 'Don`t have an account?'
                        : 'Already have an account?',
                    style: FontStyle.f16w400gray,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(
                        () => widget.isLogin
                            ? const SignupView()
                            : const Loginview(),
                      );
                    },
                    child: Text(
                      widget.isLogin ? 'SignUp' : 'LogIn',
                      style: FontStyle.f16w400gray.copyWith(
                        color: const Color(0xffFF01B252),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
