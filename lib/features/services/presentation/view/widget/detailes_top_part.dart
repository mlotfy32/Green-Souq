import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';

class DetailesTopPart extends StatelessWidget {
  const DetailesTopPart({
    super.key,
    required this.price,
    required this.servicesType,
    required this.imageUrl,
    required this.search,
  });
  final int price;
  final String servicesType;
  final String imageUrl;
  final String search;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(15),
            child: CachedNetworkImage(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              placeholder: (context, url) =>
                  const Center(child: CustomLoadingDialog(size: 40)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        Text(search, style: FontStyle.f16w500black),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Available in stock',
              style: FontStyle.f14w400gray.copyWith(color: Colors.green),
            ),
            Text('$price\$ /$servicesType', style: FontStyle.f16w500black),
          ],
        ),
      ],
    );
  }
}
