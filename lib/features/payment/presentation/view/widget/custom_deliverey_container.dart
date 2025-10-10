import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDeliveryContainer extends StatelessWidget {
  const CustomDeliveryContainer({super.key, required this.address});

  final String address;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.infinity,
            height: 120.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 19),

                Text(
                  'Address: $address',
                  style: FontStyle.f16w500black.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(height: 6),
                Text(
                  'Phone: +201275348383',
                  style: FontStyle.f16w500black.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.clip,
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.check_box, color: Colors.green),
                ),
              ],
            ),
          ),
          Container(
            width: 80.w,
            height: 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 30),
            child: Text(
              'Primary',
              style: FontStyle.f16w400gray.copyWith(color: Colors.green),
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 244, 240),
              border: Border.all(color: Colors.green, width: 1.2),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
