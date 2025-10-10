import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';
import 'package:green_souq/features/services/presentation/cubit/change_amout/change_amout_cubit.dart';
import 'package:green_souq/features/services/presentation/view/widget/servicesDetailes.dart';

class SavedItem extends StatelessWidget {
  const SavedItem({
    super.key,
    required this.price,
    required this.imageUrl,
    required this.name,
    required this.servicesType,
    required this.rating,
  });
  final String price;
  final String imageUrl;
  final String servicesType;
  final String name;
  final String rating;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(
        () => BlocProvider<ChangeAmoutCubit>(
          create: (context) => ChangeAmoutCubit(),
          child: ServicesDetailes(
            search: name,
            price1: price,
            rating1: rating,
            imageUrl: imageUrl,
            servicesType: servicesType,
            isSaved: true,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 222, 245, 223),
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(15),
              child: CachedNetworkImage(
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
                imageUrl: imageUrl,
                placeholder: (context, url) =>
                    const Center(child: CustomLoadingDialog(size: 40)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),

            Text(
              ' $name',
              style: FontStyle.f16w500black,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(rating, style: FontStyle.f14w400gray),
                const Spacer(),
                Text('$price\$', style: FontStyle.f16w500black),

                Text('/$servicesType', style: FontStyle.f14w400gray),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
