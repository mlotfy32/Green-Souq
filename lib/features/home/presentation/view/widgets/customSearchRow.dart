import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/setup_service_locator.dart';
import 'package:green_souq/core/utiles/widgets/3.3%20custom_text_field.dart';
import 'package:green_souq/features/services/domain/use_case/featch_image_use_case.dart';
import 'package:green_souq/features/services/presentation/cubit/getcategoryimages/getcategoryimages_cubit.dart';
import 'package:green_souq/features/services/presentation/view/widget/servicesCategory.dart';

class CustomSearchRow extends StatefulWidget {
  const CustomSearchRow({super.key});

  @override
  State<CustomSearchRow> createState() => _CustomSearchRowState();
}

class _CustomSearchRowState extends State<CustomSearchRow> {
  TextEditingController search = TextEditingController();
  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          SizedBox(
            height: 60,
            width: context.getWidth(context: context) - 60,
            child: CustomTextField(
              controller: search,
              onFieldSubmitted: (text) {
                context.navigateTo(
                  context: context,
                  child: BlocProvider<GetcategoryimagesCubit>(
                    create: (context) =>
                        GetcategoryimagesCubit(sl.get<FeatchImageUseCase>()),
                    child: ServicesCategory(title: text),
                  ),
                );
              },
              hintText: 'Search here....',
              prefixIcon: const Icon(FontAwesomeIcons.search, size: 22),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(FontAwesomeIcons.sliders, color: Color(0xffFF01B252)),
        ],
      ),
    );
  }
}
