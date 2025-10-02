import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/features/services/domain/entites/disease_entite.dart';
import 'package:green_souq/features/services/presentation/cubit/changecourcedetailes/changecourcedetailes_cubit.dart';
import 'package:green_souq/features/services/presentation/cubit/diseaseVideo/cources_cubit.dart';
import 'package:green_souq/features/services/presentation/view/widget/custom_rich_text.dart';
import 'package:green_souq/features/services/presentation/view/widget/disease_top_part.dart';
import 'package:green_souq/features/services/presentation/view/widget/disease_treatment.dart';
import 'package:green_souq/features/services/presentation/view/widget/related_disease.dart';
import 'package:green_souq/features/services/presentation/view/widget/video_view.dart';

class CorpDiseaseViewBody extends StatelessWidget {
  const CorpDiseaseViewBody({
    super.key,
    required this.disease,
    required this.image,
  });
  final List<DiseaseEntite> disease;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<CourcesCubit, CourcesState>(
        listener: (context, state) {
          if (state is CourcesFailure) {
            Helper.FlutterToast(title: state.error, success: false);
          } else if (state is CourcesSuccess) {
            Get.to(
              () => BlocProvider<ChangecourcedetailesCubit>(
                create: (context) => ChangecourcedetailesCubit(),
                child: CourceSuccess(
                  cources: state.cources,
                  diseaseName: '${disease[0].name} treatment',
                ),
              ),
            );
          } else {
            Helper.FlutterToast(title: 'Loading...', success: true);
          }
        },
        child: SafeArea(
          child: ListView(
            children: [
              DiseaseTopPart(imageUrl: image),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRichText(
                      title: 'Disease Name',
                      subTitle: disease[0].name,
                    ),
                    const SizedBox(height: 5),

                    const Text('Common Names: ', style: FontStyle.f16w500black),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: disease[0].common_names.asMap().entries.map((
                        val,
                      ) {
                        return SizedBox(
                          width: context.getWidth(context: context),

                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            '${disease[0].common_names[val.key]},',
                            style: FontStyle.f16w400gray,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Wiki Description:',
                            style: FontStyle.f16w500black,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.bottomSheet(
                                DiseaseBottomSheet(
                                  title: 'Wiki Description',
                                  content: disease[0].wiki_description,
                                ),
                                isScrollControlled: true,
                              );
                            },
                            child: const Text('see more'),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      disease[0].wiki_description,
                      style: FontStyle.f16w400gray,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    const Text('Symptoms: ', style: FontStyle.f16w500black),
                    const SizedBox(height: 3),
                    Column(
                      children: disease[0].common_names.asMap().entries.map((
                        val,
                      ) {
                        return Text(
                          overflow: TextOverflow.ellipsis,
                          '${val.key}: ${disease[0].symptoms.leaf_curling}',
                          style: FontStyle.f16w400gray,
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Severity: ',
                            style: FontStyle.f16w500black,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.bottomSheet(
                                DiseaseBottomSheet(
                                  title: 'Severity',
                                  content: disease[0].severity,
                                ),
                                isScrollControlled: true,
                              );
                            },
                            child: const Text('see more'),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      overflow: TextOverflow.clip,
                      '${disease[0].severity}',
                      maxLines: 3,
                      style: FontStyle.f16w400gray,
                    ),
                    DiseaseTreatment(treatment: disease[0].treatment),
                    const SizedBox(height: 3),
                    const Text(
                      'Similar Images: ',
                      style: FontStyle.f16w500black,
                    ),
                    const SizedBox(height: 3),
                    RelatedDisease(images: disease[0].similar_images),
                    const SizedBox(height: 5),

                    Customelinearbutton(
                      onTap: () {
                        BlocProvider.of<CourcesCubit>(
                          context,
                        ).getDiseaseName(diseaseName: disease[0].name);
                      },
                      child: Text(
                        'Watch Video',
                        style: FontStyle.f22w500black.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      width: double.infinity,
                      height: 50,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiseaseBottomSheet extends StatelessWidget {
  const DiseaseBottomSheet({
    super.key,
    required this.title,
    required this.content,
  });
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      height: context.getHeight(context: context) - 200,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),

      child: ListView(
        children: [
          Text(
            title,
            style: FontStyle.f22w500black,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(content, style: FontStyle.f16w400gray),
        ],
      ),
    );
  }
}
