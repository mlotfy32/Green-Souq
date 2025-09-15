import 'package:flutter/material.dart';

class BackText extends StatelessWidget {
  const BackText({
    super.key,
    required this.widget,
    required this.color,
    required this.radious,
  });
  final Widget widget;
  final Color color;
  final double radious;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radious),
        color: color,
      ),
      child: widget,
    );
  }
}
