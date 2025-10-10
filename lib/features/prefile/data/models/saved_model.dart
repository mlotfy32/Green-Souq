import 'package:hive_flutter/hive_flutter.dart';
part 'saved_model.g.dart';

@HiveType(typeId: 0)
class SavedModel {
  @HiveField(0)
  final String imageUrl;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String price;
  @HiveField(3)
  final String rating;
  @HiveField(4)
  final String servicesType;
  @HiveField(5)
  final String description;

  SavedModel({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
    required this.servicesType,
    required this.description,
  });
}
