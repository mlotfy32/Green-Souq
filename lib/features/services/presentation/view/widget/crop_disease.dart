import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/core/utiles/setup_service_locator.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';
import 'package:green_souq/features/services/domain/use_case/featch_disease_video_use_case.dart';
import 'package:green_souq/features/services/presentation/cubit/disease/disease_cubit.dart';
import 'package:green_souq/features/services/presentation/cubit/diseaseVideo/cources_cubit.dart';
import 'package:green_souq/features/services/presentation/view/widget/corp_disease_view_body.dart';

class CropDisease extends StatefulWidget {
  const CropDisease({super.key, required this.image});
  final String image;
  @override
  State<CropDisease> createState() => _CropDiseaseState();
}

class _CropDiseaseState extends State<CropDisease> {
  @override
  void initState() {
    BlocProvider.of<DiseaseCubit>(context).getDisease(image: widget.image);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<DiseaseCubit, DiseaseState>(
        builder: (context, state) {
          if (state is DiseaseFailure) {
            return Center(child: Text(state.error));
          } else if (state is DiseaseSuccess) {
            return BlocProvider<CourcesCubit>(
              create: (context) =>
                  CourcesCubit(sl.get<FeatchDiseaseVideoUseCase>()),
              child: CorpDiseaseViewBody(
                disease: state.disease,
                image: widget.image,
              ),
            );
          }
          return const Center(child: CustomLoadingDialog(size: 60));
        },
      ),
    );
  }
}
