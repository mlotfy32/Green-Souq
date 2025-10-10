import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';
import 'package:green_souq/features/services/presentation/cubit/change_amout/change_amout_cubit.dart';
import 'package:green_souq/features/services/presentation/cubit/getcategoryimages/getcategoryimages_cubit.dart';
import 'package:green_souq/features/services/presentation/view/widget/servicesDetailes.dart';
import 'package:green_souq/main.dart';

class RelatedProducts extends StatefulWidget {
  const RelatedProducts({
    super.key,
    required this.search,
    required this.servicesType,
  });
  final String search;
  final String servicesType;
  @override
  State<RelatedProducts> createState() => _RelatedProductsState();
}

class _RelatedProductsState extends State<RelatedProducts> {
  @override
  void initState() {
    BlocProvider.of<GetcategoryimagesCubit>(
      context,
    ).getImages(search: widget.search);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,

      child: BlocBuilder<GetcategoryimagesCubit, GetcategoryimagesState>(
        builder: (context, state) {
          if (state is GetcategoryimagesFailure) {
            return Text(state.error);
          }
          if (state is GetcategoryimagesSuccess) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  log('message');
                  context.navigateTo(
                    context: context,
                    child: BlocProvider<ChangeAmoutCubit>(
                      create: (context) => ChangeAmoutCubit(),
                      child: ServicesDetailes(
                        price1: '',
                        rating1: '',
                        isSaved: savedList.contains(state.images[index].name),
                        search: state.images[index].name,
                        imageUrl: state.images[index].image,
                        servicesType: widget.servicesType,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 3,
                  ),
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
                      height: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: state.images[index].image,
                      placeholder: (context, url) =>
                          const Center(child: CustomLoadingDialog(size: 40)),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),

                  width: 100,
                ),
              ),
            );
          }
          return const Center(child: CustomLoadingDialog(size: 60));
        },
      ),
    );
  }
}
