import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: const Icon(
              Icons.menu_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
          const Text(
            textAlign: TextAlign.center,
            'Profile',
            style: FontStyle.f22w500black,
            overflow: TextOverflow.ellipsis,
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: const Icon(Icons.edit, size: 25, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
