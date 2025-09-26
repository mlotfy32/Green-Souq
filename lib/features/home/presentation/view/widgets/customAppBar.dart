import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_souq/features/home/data/userData/displayUserData.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.isSearch});
  final String title;
  final bool isSearch;
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
          // SizedBox(width: title == '' ? 15 : 70),
          title == ''
              ? SizedBox(
                  height: 50,
                  child: Column(
                    children: [
                      Text(
                        'Hi ${DisplayUserData().getUserData()}! 👋',
                        style: FontStyle.f16w500black,
                      ),
                      const Text(
                        'Enjoy our services!',
                        style: FontStyle.f14w400gray,
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  width: 160,
                  child: Text(
                    textAlign: TextAlign.center,
                    title,
                    style: FontStyle.f22w500black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
          // const Spacer(),
          Icon(
            isSearch ? FontAwesomeIcons.search : FontAwesomeIcons.solidBell,
            color: const Color(0xffFF01B252),
          ),
          // const SizedBox(width: 20),
        ],
      ),
    );
  }
}
