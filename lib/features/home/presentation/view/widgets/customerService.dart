import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/styles/appImages.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';

class CustomerService extends StatelessWidget {
  const CustomerService({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),

      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 246, 244),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SizedBox(
            width: context.getWidth(context: context) / 2.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Free Consultation',
                  style: FontStyle.f16w500black.copyWith(color: Colors.green),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Get free support from our customer service',
                  style: FontStyle.f16w500black,
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(height: 10),

                Customelinearbutton(
                  onTap: () {},
                  child: const Text('Call now', style: FontStyle.f14w400white),
                  width: 80,
                  height: 40,
                  color: Colors.green,
                ),
              ],
            ),
          ),
          Image.asset(AppImages.freeCall, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
