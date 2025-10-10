import 'package:green_souq/features/services/domain/entites/disease_entite.dart';

class DiseaseModel extends DiseaseEntite {
  DiseaseModel({
    required super.name,
    required super.similar_images,
    required super.common_names,
    required super.wiki_description,
    required super.symptoms,
    required super.severity,
    required super.treatment,
  });
  factory DiseaseModel.fromJson(data) {
    return DiseaseModel(
      name: data['name'],

      similar_images:
          (data['similar_images'] as List?)
              ?.map((e) => e['url'] as String)
              .toList() ??
          [],
      common_names: data['details']['common_names'] ?? ['No Names Found'],
      wiki_description:
          data['details']?['wiki_description']?['value'] ?? 'Not Found',

      symptoms: Symptoms.fromJson(data['details']['symptoms']),
      severity: data['details']['severity'] ?? 'Not Found',
      treatment: Treatment.fromJson(data['details']['treatment']),
    );
  }
}

class Symptoms extends SymptomsEntites {
  Symptoms({
    required super.color_change,
    required super.leaf_curling,
    required super.stunted_growth,
    required super.bud_deformation,
  });
  factory Symptoms.fromJson(data) {
    return Symptoms(
      color_change: data?['Color change'] ?? 'Not Found',
      leaf_curling: data?['Leaf curling'] ?? 'Not Found',
      stunted_growth: data?['Stunted growth'] ?? 'Not Found',
      bud_deformation: data?['Bud deformation'] ?? 'Not Found',
    );
  }
}

class Treatment extends TreatmentEntite {
  Treatment({
    required super.prevention,
    required super.chemical_treatment,
    required super.biological_treatment,
  });
  factory Treatment.fromJson(data) {
    return Treatment(
      prevention: data?['prevention'] ?? ['Not Found'],
      chemical_treatment: data?['chemical treatment'] ?? ['Not Found'],
      biological_treatment: data?['biological treatment'] ?? ['Not Found'],
    );
  }
}
