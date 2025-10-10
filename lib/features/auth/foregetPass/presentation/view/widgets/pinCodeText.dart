import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Pincodetext extends StatelessWidget {
  Pincodetext({
    super.key,
    required this.otpController,
    required this.Otpkey,
    required this.otp,
  });
  final TextEditingController otpController;
  final Otpkey;
  final int otp;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: Otpkey,

      child: PinCodeTextField(
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return 'please enter otp';
          }
          return null;
        },
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        appContext: context,
        length: 6,
        controller: otpController,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
          inactiveColor: Colors.grey,
          selectedColor: Colors.blue,
        ),
      ),
    );
  }
}
