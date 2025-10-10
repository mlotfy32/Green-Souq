import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:green_souq/features/prefile/presentation/view/widgets/custom_circle_image.dart';
import 'package:green_souq/features/prefile/presentation/view/widgets/custom_profile_appbar.dart';
import 'package:green_souq/features/prefile/presentation/view/widgets/custom_setting_list.dart';
import 'package:green_souq/main.dart';

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
            const SizedBox(height: 20),
            CustomCircleImage(
              location: prefs.getString(PrefsKeys.userAddress) ?? 'not found',
              userPic:
                  prefs.getString(PrefsKeys.userImage) ??
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB0a9Vv--jOowQtVo_DNHzY7CvSizocuT8pA&s',
            ),
            const SizedBox(height: 20),
            CustomSettingList(),
          ],
        ),
      ),
    );
  }
}
