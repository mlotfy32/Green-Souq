import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';
import 'package:green_souq/features/services/presentation/cubit/disease/disease_cubit.dart';

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
            return Center(
              child: Text(state.disease[0].common_names.first.toString()),
            );
          }
          return const Center(child: CustomLoadingDialog(size: 60));
        },
      ),
    );
  }
}
