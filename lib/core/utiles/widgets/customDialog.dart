import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/styles/appImages.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/features/home/presentation/view/homeTap.dart';
import 'package:lottie/lottie.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

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
            Lottie.asset(AppImages.success, height: 150),
            const Text(
              textAlign: TextAlign.center,
              'Success LogIn',
              style: FontStyle.f16w400gray,
            ),
            const SizedBox(height: 10),
            Customelinearbutton(
              onTap: () => context.navigateOffAll(
                context: context,
                child: const HomeTap(),
              ),
              child: Text(
                'Go to home',
                style: FontStyle.f16w400gray.copyWith(color: Colors.white),
              ),
              width: double.infinity,
              height: 50,
              color: const Color(0xffFF01B252),
            ),
          ],
        ),
      ),
    );
  }
}
