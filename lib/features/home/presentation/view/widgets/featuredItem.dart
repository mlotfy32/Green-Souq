import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/features/auth/foregetPass/data/generateOtp.dart';

class FeaturedProductItem extends StatelessWidget {
  const FeaturedProductItem({
    super.key,
    required this.name,
    required this.image,
    required this.servicesType,
  });
  final String name;
  final String image;
  final String servicesType;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 3),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 222, 245, 223),
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 180,
                width: 140,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(15),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: image,
                    placeholder: (context, url) =>
                        const Center(child: CustomLoadingDialog(size: 40)),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white54,
                        offset: Offset(0.1, 0.1),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.bookmark_border_rounded,
                    size: 31,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Text(
            ' $name',
            style: FontStyle.f16w500black,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              Text(
                ' ${GenerateOtp().generateRandomNumber(2)}\$',
                style: FontStyle.f16w500black,
              ),
              Text('/$servicesType', style: FontStyle.f14w400gray),
              const Spacer(),
              Customelinearbutton(
                onTap: () {},
                child: const Icon(Icons.add, color: Colors.white),
                width: 40,
                height: 30,
                color: Colors.green,
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}

List<String> servicesType = ['/ke', '/pcs', '/day', '/day', '', ''];
