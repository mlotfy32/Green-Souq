import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, this.onPressed, required this.icon});
  final void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.green,
        ),
        width: 35,
        height: 35,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
