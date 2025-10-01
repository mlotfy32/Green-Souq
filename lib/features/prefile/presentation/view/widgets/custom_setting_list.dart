import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';

// ignore: must_be_immutable
class CustomSettingList extends StatelessWidget {
  CustomSettingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: settingsList.asMap().entries.map((value) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            children: [
              Icon(iconsList[value.key], color: Colors.grey),
              const SizedBox(width: 10),
              Text(
                settingsList[value.key],
                style: FontStyle.f22w500black.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_right_sharp),
            ],
          ),
        );
      }).toList(),
    );
  }

  List<String> settingsList = [
    'Shopping Address',
    'Payment Settings',
    'Order History',
    'Settings',
    'Privacy Police',
    'Logout',
  ];
  List<IconData> iconsList = [
    FontAwesomeIcons.locationDot,
    FontAwesomeIcons.creditCard,
    Icons.history_edu,
    Icons.settings,
    FontAwesomeIcons.shieldHalved,
    Icons.logout_rounded,
  ];
}
