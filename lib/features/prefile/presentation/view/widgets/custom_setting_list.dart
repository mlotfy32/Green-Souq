import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/core/utiles/widgets/customDialog.dart';
import 'package:green_souq/features/prefile/presentation/cubits/saved/getlocation/getlocation_cubit.dart';
import 'package:green_souq/features/prefile/presentation/cubits/saved/saved_cubit.dart';
import 'package:green_souq/features/prefile/presentation/view/widgets/address_view.dart';
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
            onTap: () => value.key == 2
                ? Get.defaultDialog(
                    title: '',
                    backgroundColor: Colors.white,
                    content: const CustomDialog(isLogout: true, isReset: false),
                  )
                : context.navigateTo(
                    context: context,
                    child: switcher(index: value.key),
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

  switcher({required int index}) {
    switch (index) {
      case 0:
        {
          return BlocProvider<GetlocationCubit>(
            create: (context) => GetlocationCubit(),
            child: const AddressView(),
          );
        }
      case 1:
        Get.to(
          () => BlocProvider<SavedCubit>(
            create: (context) => SavedCubit(),
            child: const SavedView(),
          ),
        );
        break;
    }
  }

  List<String> settingsList = ['Shopping Address', 'Saved', 'Logout'];
  List<IconData> iconsList = [
    FontAwesomeIcons.locationDot,
    Icons.bookmark,
    Icons.logout_rounded,
  ];
}
