import 'package:flutter/material.dart';
import 'package:green_souq/features/prefile/presentation/view/widgets/custom_circle_image.dart';
import 'package:green_souq/features/prefile/presentation/view/widgets/custom_profile_appbar.dart';
import 'package:green_souq/features/prefile/presentation/view/widgets/custom_setting_list.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomProfileAppBar(),
            const CustomCircleImage(),
            CustomSettingList(),
          ],
        ),
      ),
    );
  }
}
