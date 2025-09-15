import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/styles/appImages.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:green_souq/features/services/presentation/cubit/getcategoryimages/getcategoryimages_cubit.dart';
import 'package:green_souq/features/services/presentation/view/widget/backText.dart';
import 'package:green_souq/features/services/presentation/view/widget/servicesCategory.dart';

class ServicesItem extends StatelessWidget {
  const ServicesItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.navigateTo(
          context: context,
          child: BlocProvider<GetcategoryimagesCubit>(
            create: (context) => GetcategoryimagesCubit(),
            child: ServicesCategory(title: servicesNames[index]),
          ),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(bottom: 5),
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(AppImages.servicesImages[index]),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BackText(
              widget: Text(servicesNames[index], style: FontStyle.f16w500white),
              color: Colors.black26,
              radious: 15,
            ),
            const SizedBox(height: 10),
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
