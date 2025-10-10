import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/core/utiles/setup_service_locator.dart';
import 'package:green_souq/features/auth/foregetPass/data/generateOtp.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/features/cart/presentation/cubit/addtocart/addtocart_cubit.dart';
import 'package:green_souq/features/prefile/presentation/cubits/saved/saved_cubit.dart';
import 'package:green_souq/features/services/domain/use_case/featch_image_use_case.dart';
import 'package:green_souq/features/services/presentation/cubit/change_amout/change_amout_cubit.dart';
import 'package:green_souq/features/services/presentation/cubit/getcategoryimages/getcategoryimages_cubit.dart';
import 'package:green_souq/features/services/presentation/view/widget/customIconButton.dart';
import 'package:green_souq/features/services/presentation/view/widget/detailes_appbar.dart';
import 'package:green_souq/features/services/presentation/view/widget/detailes_top_part.dart';
import 'package:green_souq/features/services/presentation/view/widget/linear_button.dart';
import 'package:green_souq/features/services/presentation/view/widget/related_products.dart';

class ServicesDetailes extends StatefulWidget {
  const ServicesDetailes({
    super.key,
    required this.search,
    required this.imageUrl,
    required this.servicesType,
    required this.isSaved,
    required this.rating1,
    required this.price1,
  });
  final String search;
  final String imageUrl;
  final String servicesType;
  final String rating1;
  final String price1;
  final bool isSaved;
  @override
  State<ServicesDetailes> createState() => _ServicesDetailesState();
}

class _ServicesDetailesState extends State<ServicesDetailes> {
  @override
  Widget build(BuildContext context) {
    log(widget.search);
    int price = GenerateOtp().generateRandomNumber(2);
    String rating =
        '⭐ ${GenerateOtp().generateRandomNumber(1)}.${GenerateOtp().generateRandomNumber(1)} (${GenerateOtp().generateRandomNumber(3)})';
    int count = 1;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocProvider<SavedCubit>(
                create: (context) => SavedCubit(),
                child: DetailesAppBar(
                  isSaved: widget.isSaved,
                  description: 'No Description',
                  imageUrl: widget.imageUrl,
                  name: widget.search,
                  price: price.toString(),
                  rating: rating,
                  servicesType: widget.servicesType,
                ),
              ),
              DetailesTopPart(
                price: widget.price1 == '' ? price : int.parse(widget.price1),
                servicesType: widget.servicesType,
                imageUrl: widget.imageUrl,
                search: widget.search,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.rating1 == '' ? rating : widget.rating1,
                    style: FontStyle.f14w400gray,
                  ),
                  Row(
                    children: [
                      CustomIconButton(
                        icon: Icons.remove,
                        onPressed: () {
                          BlocProvider.of<ChangeAmoutCubit>(
                            context,
                          ).changeAmount(count: count > 1 ? --count : count);
                        },
                      ),
                      BlocBuilder<ChangeAmoutCubit, ChangeAmoutState>(
                        builder: (context, state) {
                          final amount = BlocProvider.of<ChangeAmoutCubit>(
                            context,
                          ).amount;
                          return Text(
                            '  ${amount == null ? 1 : amount} /${widget.servicesType} ',
                          );
                        },
                      ),
                      CustomIconButton(
                        icon: Icons.add,
                        onPressed: () {
                          BlocProvider.of<ChangeAmoutCubit>(
                            context,
                          ).changeAmount(count: ++count);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const Text('Description', style: FontStyle.f22w500black),
              SizedBox(
                width: double.infinity,
                height: 150,
                child: Text(
                  widget.search == 'Rice Seeds'
                      ? 'Rice seeds are small grains used to grow rice plants. They have a hard outer husk that protects the inner seed. When planted in wet soil, they germinate and grow into rice plants that produce edible grains.'
                      : widget.search ==
                            'a close up of a group of small green plants'
                      ? 'A close-up view showing a group of small, fresh green plants growing close together.Their tiny leaves look bright and healthy, covered with soft sunlight or small drops of water. The image gives a feeling of new life, freshness, and natural growth. The background is usually blurred to focus on the fine details of the plants — such as the texture of the leaves and stems.'
                      : widget.search == 'brown beans'
                      ? 'Brown beans are small, oval-shaped beans with a light to dark brown color. They are rich in protein, fiber, and essential minerals, making them a healthy food choice. When cooked, brown beans have a creamy texture and a slightly nutty flavor.'
                      : '''A tractor is a powerful agricultural vehicle designed primarily to deliver high torque (tractive effort) at slow speeds for hauling or operating various types of farm machinery.''',
                  overflow: TextOverflow.clip,
                ),
              ),
              const Spacer(),
              const Text('Related Products', style: FontStyle.f22w500black),
              BlocProvider(
                create: (context) =>
                    GetcategoryimagesCubit(sl.get<FeatchImageUseCase>()),
                child: RelatedProducts(
                  search: widget.search,
                  servicesType: widget.servicesType,
                ),
              ),
              const Spacer(),
              BlocProvider<AddtocartCubit>(
                create: (context) => AddtocartCubit(),
                child: LinearButton(
                  iamgeUrl: widget.imageUrl,
                  search: widget.search,
                  price: price,
                  servicesType: widget.servicesType,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
