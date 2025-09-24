// import 'package:green_souq/core/utiles/constanse.dart';
// import 'package:green_souq/features/services/domain/entites/images_entite.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// abstract class ServicesLocalDataSource {
//   Future<List<ImagesEntite>> featchImages();
// }

// class LocalDataSource extends ServicesLocalDataSource {
//   @override
//   Future<List<ImagesEntite>> featchImages() async {
//     var box = Hive.box<ImagesEntite>(Constanse.kImagesBox);
//     List<ImagesEntite> images = box.values.toList();
//     return images;
//   }
// }
