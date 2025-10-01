import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/features/prefile/presentation/cubits/saved/saved_cubit.dart';
import 'package:green_souq/features/prefile/presentation/view/widgets/saved_view.dart';

// ignore: must_be_immutable
class CustomSettingList extends StatelessWidget {
  CustomSettingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: settingsList.asMap().entries.map((value) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: InkWell(
            onTap: () => context.navigateTo(
              context: context,
              child: BlocProvider<SavedCubit>(
                create: (context) => SavedCubit(),
                child: const SavedView(),
              ),
            ),
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
          ),
        );
      }).toList(),
    );
  }

  List<String> settingsList = [
    'Shopping Address',
    'Payment Settings',
    'Order History',
    'Saved',
    'Privacy Police',
    'Logout',
  ];
  List<IconData> iconsList = [
    FontAwesomeIcons.locationDot,
    FontAwesomeIcons.creditCard,
    Icons.history_edu,
    Icons.bookmark,
    FontAwesomeIcons.shieldHalved,
    Icons.logout_rounded,
  ];
}
