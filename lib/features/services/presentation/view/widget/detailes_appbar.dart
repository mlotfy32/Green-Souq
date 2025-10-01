import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';

class DetailesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          context.navigateBack(context: context);
        },
        icon: const Icon(Icons.arrow_back_ios, size: 30),
      ),
      title: const Text('Details', style: FontStyle.f22w500black),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(FontAwesomeIcons.bookmark),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
