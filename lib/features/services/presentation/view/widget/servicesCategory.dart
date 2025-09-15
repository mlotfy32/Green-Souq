import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';
import 'package:green_souq/features/home/presentation/view/widgets/customAppBar.dart';
import 'package:green_souq/features/home/presentation/view/widgets/featuredItem.dart';
import 'package:green_souq/features/services/presentation/cubit/getcategoryimages/getcategoryimages_cubit.dart';
import 'package:green_souq/features/services/presentation/view/widget/servicesDetailes.dart';

class ServicesCategory extends StatefulWidget {
  const ServicesCategory({super.key, required this.title});
  final String title;

  @override
  State<ServicesCategory> createState() => _ServicesCategoryState();
}

class _ServicesCategoryState extends State<ServicesCategory> {
  @override
  void initState() {
    BlocProvider.of<GetcategoryimagesCubit>(
      context,
    ).getImages(search: widget.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> servicesType = {
      'Seeds': 'kg',
      'Seedlings': 'pcs',
      'Machinery': 'day',
      'Hire Worker': 'day',
      'Cultivation Process': '',
      'Crop Disease Solution': '',
    };
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: CustomAppBar(title: widget.title, isSearch: true),
              ),
              SizedBox(
                height: context.getHeight(context: context) - 86,
                child:
                    BlocBuilder<GetcategoryimagesCubit, GetcategoryimagesState>(
                      builder: (context, state) {
                        if (state is GetcategoryimagesFailure) {
                          return Center(child: Text(state.error));
                        } else if (state is GetcategoryimagesSuccess) {
                          return GridView.builder(
                            itemCount: state.images.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 250,
                                  crossAxisSpacing: 4,
                                ),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => Get.to(
                                () => BlocProvider<GetcategoryimagesCubit>(
                                  create: (context) => GetcategoryimagesCubit(),
                                  child: ServicesDetailes(
                                    servicesType: servicesType[widget.title]!,

                                    imageUrl: state.images[index].image,
                                    search: state.images[index].name,
                                  ),
                                ),
                              ),
                              child: FeaturedProductItem(
                                servicesType: servicesType[widget.title]!,
                                image: state.images[index].image,
                                name: state.images[index].name,
                              ),
                            ),
                          );
                        }
                        return const CustomLoadingDialog(size: 100);
                      },
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
