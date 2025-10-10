import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/styles/appImages.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';
import 'package:green_souq/features/auth/signUp/presentation/cubit/uplodimage/uplodimage_cubit.dart';
import 'package:green_souq/features/services/domain/use_case/featch_image_use_case.dart';
import 'package:green_souq/features/services/presentation/cubit/getcategoryimages/getcategoryimages_cubit.dart';
import 'package:green_souq/features/services/presentation/view/widget/backText.dart';
import 'package:green_souq/features/services/presentation/view/widget/cro_disease_view.dart';
import 'package:green_souq/features/services/presentation/view/widget/servicesCategory.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';

class ServicesItem extends StatelessWidget {
  const ServicesItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (index == 5) {
          Get.to(
            () => BlocProvider<UplodimageCubit>(
              create: (context) => UplodimageCubit(),
              child: const CroDiseaseView(),
            ),
          );
        } else
          context.navigateTo(
            context: context,
            child: BlocProvider<GetcategoryimagesCubit>(
              create: (context) =>
                  GetcategoryimagesCubit(sl.get<FeatchImageUseCase>()),
              child: ServicesCategory(title: servicesNames[index]),
            ),
          );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(bottom: 5),
        height: 180.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(15),
              child: CachedNetworkImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                imageUrl: AppImages.servicesImages[index],
                placeholder: (context, url) =>
                    const Center(child: CustomLoadingDialog(size: 40)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: BackText(
                  widget: Text(
                    servicesNames[index],
                    style: FontStyle.f16w500white,
                  ),
                  color: Colors.black26,
                  radious: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> servicesNames = [
  'Seeds',
  'Seedlings',
  'Machinery',
  'Hire Worker',
  'Cultivation Process',
  'Crop Disease Solution',
];
