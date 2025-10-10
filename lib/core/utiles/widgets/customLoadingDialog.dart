import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({super.key, required this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: context.getWidth(context: context) - 100,
        height: context.getHeight(context: context) / 3.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Center(
          child: LoadingAnimationWidget.dotsTriangle(
            color: const Color(0xffFF01B252),
            size: size,
          ),
        ),
      ),
    );
  }
}
