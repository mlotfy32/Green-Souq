import 'package:green_souq/features/services/domain/entites/images_entite.dart';

class ImagesModel extends ImagesEntite {
  ImagesModel({required super.image, required super.name});
  factory ImagesModel.fromJson(data) {
    return ImagesModel(
      image: data['urls']['raw'] ?? 'noData',
      name: data['alt_description'] ?? 'noData',
    );
  }
}
