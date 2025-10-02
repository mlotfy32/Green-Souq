import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_souq/core/utiles/setup_service_locator.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/features/auth/signUp/presentation/cubit/uplodimage/uplodimage_cubit.dart';
import 'package:green_souq/features/services/domain/use_case/featch_disease_usecase.dart';
import 'package:green_souq/features/services/presentation/cubit/disease/disease_cubit.dart';
import 'package:green_souq/features/services/presentation/view/widget/crop_disease.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';

class CroDiseaseView extends StatelessWidget {
  const CroDiseaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<UplodimageCubit, UplodimageState>(
        builder: (context, state) {
          if (state is UplodimageFailure) {
            return const Center(child: Text('Error'));
          } else if (state is UplodimageSuccess) {
            return BlocProvider<DiseaseCubit>(
              create: (context) => DiseaseCubit(sl.get<FeatchDiseaseUsecase>()),
              child: CropDisease(image: state.imageUrl),
            );
          } else if (state is UplodimageProgress) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    radius: 40.0,
                    percent: state.progress,
                    center: Text(
                      "${(state.progress * 100).toStringAsFixed(0)}%",
                    ),
                    progressColor: Colors.blue,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Uploading image...',
                    style: FontStyle.f16w500black,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else if (state is UplodimageLoading) {
            return const Center(child: CustomLoadingDialog(size: 60));
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please Choose Plant Image',
                style: FontStyle.f22w500black,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Customelinearbutton(
                    onTap: () => BlocProvider.of<UplodimageCubit>(
                      context,
                    ).uploadImage(path: 'diseases', source: ImageSource.camera),
                    child: const Icon(
                      FontAwesomeIcons.camera,
                      color: Colors.white,
                    ),
                    width: 150,
                    height: 50,
                    color: Colors.green,
                  ),
                  Customelinearbutton(
                    onTap: () =>
                        BlocProvider.of<UplodimageCubit>(context).uploadImage(
                          path: 'diseases',
                          source: ImageSource.gallery,
                        ),
                    child: const Icon(Icons.image, color: Colors.white),
                    width: 150,
                    height: 50,
                    color: Colors.green,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
