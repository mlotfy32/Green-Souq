import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';

class FeaturedProductItem extends StatefulWidget {
  const FeaturedProductItem({super.key});

  @override
  State<FeaturedProductItem> createState() => _FeaturedProductItemState();
}

class _FeaturedProductItemState extends State<FeaturedProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
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
              Container(
                width: 140,
                height: 180,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 1,
                      offset: Offset(0, 3),
                      blurStyle: BlurStyle.inner,
                      spreadRadius: 0.1,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyYopWRZRMOG_LvUSuuAgrvAI4Z2SSj-xgmQ&s',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () {},
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
              ),
            ],
          ),
          const Text(' Rice', style: FontStyle.f16w500black),
          Row(
            children: [
              const Text(' 120\$', style: FontStyle.f16w500black),
              const Text('/kg', style: FontStyle.f14w400gray),
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
