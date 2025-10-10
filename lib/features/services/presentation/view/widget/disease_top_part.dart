import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';

class DiseaseTopPart extends StatelessWidget {
  const DiseaseTopPart({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                context.navigateBack(context: context);
              },
              icon: const Icon(Icons.arrow_back_ios, size: 30),
            ),
            const Text('Plant Disease', style: FontStyle.f22w500black),
            const Icon(FontAwesomeIcons.bookmark, color: Colors.green),
          ],
        ),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(15),
            child: CachedNetworkImage(
              width: double.infinity,
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              placeholder: (context, url) =>
                  const Center(child: CustomLoadingDialog(size: 40)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ],
    );
  }
}
