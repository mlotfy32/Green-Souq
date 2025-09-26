import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:flutter/material.dart';

class CustomCircleImage extends StatelessWidget {
  const CustomCircleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          '138',
                          style: FontStyle.f22w500black.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,

                          'Favorite',
                          style: FontStyle.f22w500black.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          '65',
                          style: FontStyle.f22w500black.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,

                          'Orders',
                          style: FontStyle.f22w500black.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                width: double.infinity,
                height: 100,
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                      'https://tnoyqwewkojfisfbgkme.supabase.co/storage/v1/object/public/images/uploads/1757759051534.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            textAlign: TextAlign.center,

            'Mhmd Lotfy',
            style: FontStyle.f22w500black,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_pin, color: Colors.grey),
              Text(
                textAlign: TextAlign.center,

                'Mansoura',
                style: FontStyle.f16w400gray,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
