import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';

class RelatedDisease extends StatelessWidget {
  const RelatedDisease({super.key, required this.images});
  final List<dynamic> images;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: const Color.fromARGB(255, 216, 244, 216),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(15),
            child: CachedNetworkImage(
              width: double.infinity,
              height: 90,
              fit: BoxFit.cover,
              imageUrl: images[index],
              placeholder: (context, url) =>
                  const Center(child: CustomLoadingDialog(size: 40)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),

          width: 100,
        ),
      ),
    );
  }
}
