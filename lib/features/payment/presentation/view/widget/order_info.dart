import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:flutter/material.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            Text('      $title:', style: FontStyle.f16w500black),
            const Spacer(),
            Text('$subTitle\$      ', style: FontStyle.f16w400gray),
          ],
        ),
      ],
    );
  }
}
