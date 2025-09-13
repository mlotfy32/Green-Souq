import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:flutter/material.dart';

class CustomBackRow extends StatelessWidget {
  const CustomBackRow({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(title, style: FontStyle.f25w500black)],
    );
  }
}
