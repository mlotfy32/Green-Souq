import 'package:hive/hive.dart';
part 'images_entite.g.dart';

@HiveType(typeId: 0)
class ImagesEntite {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String name;

  ImagesEntite({required this.image, required this.name});
}
