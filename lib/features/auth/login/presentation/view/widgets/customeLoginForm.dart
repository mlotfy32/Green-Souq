import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_souq/core/utiles/widgets/3.3%20custom_text_field.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/features/auth/login/data/loginMethodes/phoneLogIn.dart';
import 'package:green_souq/features/auth/login/data/userDataModel/getUserData.dart';
import 'package:green_souq/features/auth/login/presentation/cubit/passwordvisability/passwordvisability_cubit.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';

class CustomeLoginForm extends StatelessWidget {
  const CustomeLoginForm({
    super.key,
    required this.phone,
    required this.pass,
    required this.formKey,
    required this.isLogin,
    required this.confirmPass,
  });
  final TextEditingController phone;
  final TextEditingController pass;
  final TextEditingController confirmPass;
  final GlobalKey<FormState> formKey;
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    bool isVisable = true;
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(isLogin ? 'LogIn' : 'SignUp', style: FontStyle.f25w500black),
            SizedBox(height: 10.h),

            CustomTextField(
              prefixIcon: const Icon(Icons.lock_open),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'phone is required';
                }
                return null;
              },
              controller: phone,
              hintText: 'Phone numper',
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10.h),
            BlocBuilder<PasswordvisabilityCubit, PasswordvisabilityState>(
              builder: (context, state) {
                isVisable = state is Passwordvisability
                    ? state.isPasswordVisible
                    : isVisable;
                return Column(
                  children: [
                    CustomTextField(
                      controller: pass,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'password is required';
                        } else if (value.length < 8) {
                          return 'password can`t be less than 8 letters';
                        }
                        return null;
                      },
                      hintText: 'Password',
                      obscureText: isVisable,
                      suffixIcon: IconButton(
                        onPressed: () {
                          BlocProvider.of<PasswordvisabilityCubit>(
                            context,
                          ).changeVisability(isVisable: !isVisable);
                        },
                        icon: Icon(
                          size: 20,
                          state is Passwordvisability &&
                                  state.isPasswordVisible == false
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          color: const Color(0xff757575),
                        ),
                      ),
                    ),

                    isLogin
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomTextField(
                              controller: confirmPass,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'password is required';
                                } else if (value != pass.text) {
                                  return 'password not match';
                                }
                                return null;
                              },
                              hintText: 'Re enter password',
                              obscureText: isVisable,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  BlocProvider.of<PasswordvisabilityCubit>(
                                    context,
                                  ).changeVisability(isVisable: !isVisable);
                                },
                                icon: Icon(
                                  size: 20,
                                  state is Passwordvisability &&
                                          state.isPasswordVisible == false
                                      ? FontAwesomeIcons.eyeSlash
                                      : FontAwesomeIcons.eye,
                                  color: const Color(0xff757575),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 10.h),

                    Customelinearbutton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          if (isLogin) {
                            GetUserData().getUserData(
                              pass: pass.text,
                              phone: int.parse(phone.text),
                              context: context,
                            );
                          } else {
                            await PhoneLogin().phoneLogIn(
                              phone: phone.text,
                              pass: pass.text,
                              context: context,
                            );
                          }
                        }
                      },
                      child: Text(
                        isLogin ? 'LogIn' : 'SignUp',
                        style: FontStyle.f25w500black.copyWith(
                          color: Colors.white,
                          fontSize: 23,
                        ),
                      ),
                      width: double.infinity,
                      height: 50,
                      color: const Color(0xffFF01B252),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
