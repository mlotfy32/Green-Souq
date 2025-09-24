import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/features/auth/foregetPass/data/generateOtp.dart';
import 'package:green_souq/features/services/presentation/cubit/getcategoryimages/getcategoryimages_cubit.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/features/services/presentation/view/widget/customCountRow.dart';

class ServicesDetailes extends StatefulWidget {
  const ServicesDetailes({
    super.key,
    required this.search,
    required this.imageUrl,
    required this.servicesType,
  });
  final String search;
  final String imageUrl;
  final String servicesType;
  @override
  State<ServicesDetailes> createState() => _ServicesDetailesState();
}

class _ServicesDetailesState extends State<ServicesDetailes> {
  @override
  void initState() {
    BlocProvider.of<GetcategoryimagesCubit>(
      context,
    ).getImages(search: widget.search);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int count = 1;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              context.navigateBack(context: context);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 30),
          ),
          title: const Text('Details', style: FontStyle.f22w500black),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.bookmark),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
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
                    imageUrl: widget.imageUrl,
                    placeholder: (context, url) =>
                        const Center(child: CustomLoadingDialog(size: 40)),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Text(widget.search, style: FontStyle.f16w500black),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Available in stock',
                    style: FontStyle.f14w400gray.copyWith(color: Colors.green),
                  ),
                  Text(
                    '${GenerateOtp().generateRandomNumber(2)}\$ ${widget.servicesType}',
                    style: FontStyle.f16w500black,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '⭐ ${GenerateOtp().generateRandomNumber(1)}.${GenerateOtp().generateRandomNumber(1)} (${GenerateOtp().generateRandomNumber(3)})',
                    style: FontStyle.f14w400gray,
                  ),
                  CustomCountRow(servicesType: widget.servicesType),
                ],
              ),
              const Text('Description', style: FontStyle.f22w500black),

              const SizedBox(
                width: double.infinity,
                height: 150,
                child: Text(
                  '''A tractor is a powerful agricultural vehicle designed primarily to deliver high torque (tractive effort) at slow speeds for hauling or operating various types of farm machinery.''',
                  overflow: TextOverflow.clip,
                ),
              ),
              const Text('Related Products', style: FontStyle.f22w500black),
              SizedBox(
                height: 90,

                child:
                    BlocBuilder<GetcategoryimagesCubit, GetcategoryimagesState>(
                      builder: (context, state) {
                        if (state is GetcategoryimagesFailure) {
                          return Text(state.error);
                        }
                        if (state is GetcategoryimagesSuccess) {
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: state.images.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 2,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(
                                    255,
                                    225,
                                    241,
                                    226,
                                  ),
                                  width: 1.5,
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    state.images[index].image,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              width: 100,
                            ),
                          );
                        }
                        return const Center(
                          child: CustomLoadingDialog(size: 60),
                        );
                      },
                    ),
              ),
              Customelinearbutton(
                onTap: () {},
                child: Text(
                  'Add to cart',
                  style: FontStyle.f22w500black.copyWith(color: Colors.white),
                ),
                width: double.infinity,
                height: 55,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
