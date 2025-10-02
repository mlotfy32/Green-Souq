import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/features/services/domain/entites/disease_entite.dart';

class DiseaseTreatment extends StatelessWidget {
  const DiseaseTreatment({super.key, required this.treatment});
  final TreatmentEntite treatment;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 3),
        const Text('Treatment: ', style: FontStyle.f16w500black),
        const SizedBox(height: 3),
        Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 3),
              const Text(
                'Biological Treatment: ',
                style: FontStyle.f16w500black,
              ),
              const SizedBox(height: 3),
              Text(
                treatment.biological_treatment[0],
                style: FontStyle.f16w400gray,
              ),
              const SizedBox(height: 3),
              const Text('Chemical Treatment: ', style: FontStyle.f16w500black),
              const SizedBox(height: 3),
              Text(
                treatment.chemical_treatment[0],
                style: FontStyle.f16w400gray,
              ),
              const SizedBox(height: 3),
              const Text('Prevention: ', style: FontStyle.f16w500black),
              const SizedBox(height: 3),
              Text(treatment.prevention[0], style: FontStyle.f16w400gray),
            ],
          ),
        ),
      ],
    );
  }
}
