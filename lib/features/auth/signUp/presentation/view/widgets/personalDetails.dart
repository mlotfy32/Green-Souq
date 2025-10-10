import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/core/utiles/widgets/3.3%20custom_text_field.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/features/auth/foregetPass/presentation/view/widgets/customeBackRow.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/features/auth/signUp/data/savePersonalData.dart';
import 'package:green_souq/features/auth/signUp/presentation/cubit/uplodimage/uplodimage_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key, required this.phone, required this.google});
  final int phone;
  final bool google;
  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController postCode = TextEditingController();
  @override
  void dispose() {
    name.dispose();
    address.dispose();
    postCode.dispose();
    super.dispose();
  }

  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List<String> hasImage = [];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            const CustomBackRow(title: 'Personal Detailes'),
            const SizedBox(height: 30),
            const Text(
              textAlign: TextAlign.center,
              'Your personal details will helps our service to reach you easly',
            ),
            const SizedBox(height: 30),

            GestureDetector(
              onTap: () {
                BlocProvider.of<UplodimageCubit>(
                  context,
                ).uploadImage(path: 'uploads', source: ImageSource.gallery);
              },
              child: BlocBuilder<UplodimageCubit, UplodimageState>(
                builder: (context, state) {
                  if (state is UplodimageSuccess) {
                    hasImage.add(state.imageUrl);
                    return CircleAvatar(
                      radius: 55,
                      backgroundColor: const Color(0xffFF01B252),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(state.imageUrl),
                      ),
                    );
                  } else if (state is UplodimageLoading) {
                    return LoadingAnimationWidget.dotsTriangle(
                      color: const Color(0xffFF01B252),
                      size: 50,
                    );
                  } else if (state is UplodimageFailure) {
                    return const CircleAvatar(
                      radius: 55,
                      child: CircleAvatar(
                        radius: 50,
                        child: Icon(Icons.error, color: Colors.red, size: 80),
                      ),
                    );
                  }
                  return const CircleAvatar(
                    radius: 55,
                    child: CircleAvatar(
                      radius: 50,
                      child: Icon(Icons.person, size: 80),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),

            Form(
              key: key,
              child: Column(
                children: [
                  CustomTextField(
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'name is required';
                      }
                      return null;
                    },
                    controller: name,
                    prefixIcon: const Icon(Icons.person, color: Colors.grey),
                    hintText: 'Enter your name',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'address is required';
                      }
                      return null;
                    },
                    controller: address,
                    prefixIcon: const Icon(
                      Icons.share_location_rounded,
                      color: Colors.grey,
                    ),
                    hintText: 'Address',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'postcode is required';
                      }
                      return null;
                    },
                    controller: postCode,
                    prefixIcon: const Icon(
                      Icons.polymer_sharp,
                      color: Colors.grey,
                    ),
                    hintText: 'Post Code',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<UplodimageCubit, UplodimageState>(
              builder: (context, state) {
                if (state is UplodimageProgress) {
                  return CircularPercentIndicator(
                    radius: 40.0,
                    percent: state.progress,
                    center: Text(
                      "${(state.progress * 100).toStringAsFixed(0)}%",
                    ),
                    progressColor: Colors.blue,
                  );
                }

                return const SizedBox(height: 20);
              },
            ),
            const SizedBox(height: 100),

            Customelinearbutton(
              onTap: () async {
                if (key.currentState!.validate()) {
                  if (hasImage.isEmpty) {
                    Helper.FlutterToast(
                      title: 'Please select your picture',
                      success: false,
                    );
                  } else {
                    SavePersonalData().saveData(
                      phone: widget.phone,
                      google: widget.google,
                      image: hasImage.first,
                      name: name.text,
                      address: address.text,
                      postCode: int.parse(postCode.text),
                    );
                  }
                }
              },
              child: Text(
                'Save',
                style: FontStyle.f25w500black.copyWith(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              width: double.infinity,
              height: 50,
              color: const Color(0xffFF01B252),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
