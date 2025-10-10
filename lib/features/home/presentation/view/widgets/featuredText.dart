import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';

class FeaturesText extends StatelessWidget {
  const FeaturesText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Featured Products', style: FontStyle.f22w500black),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text('see all', style: TextStyle(color: Colors.green)),
        ),
      ],
    );
  }
}
