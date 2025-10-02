class DiseaseEntite {
  final String name;
  final List<dynamic> similar_images; //-->url
  final List<dynamic> common_names;
  final String wiki_description; //-->value
  final SymptomsEntites symptoms; //-->اعراض
  final String severity; //-->خطوره
  final TreatmentEntite treatment; //-->prevention
  DiseaseEntite({
    required this.name,
    required this.similar_images,
    required this.common_names,
    required this.wiki_description,
    required this.symptoms,
    required this.severity,
    required this.treatment,
  });
}

class SymptomsEntites {
  final String color_change;
  final String leaf_curling;
  final String stunted_growth;
  final String bud_deformation;

  SymptomsEntites({
    required this.color_change,
    required this.leaf_curling,
    required this.stunted_growth,
    required this.bud_deformation,
  });
}

class TreatmentEntite {
  final List<dynamic> prevention;
  final List<dynamic> chemical_treatment;
  final List<dynamic> biological_treatment;

  TreatmentEntite({
    required this.prevention,
    required this.chemical_treatment,
    required this.biological_treatment,
  });
}
