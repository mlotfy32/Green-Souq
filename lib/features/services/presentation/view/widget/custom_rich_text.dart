import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        RichText(
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: ' $title: ',
            style: FontStyle.f16w500black,
            children: [
              TextSpan(text: '$subTitle', style: FontStyle.f16w400gray),
            ],
          ),
        ),
      ],
    );
  }
}
