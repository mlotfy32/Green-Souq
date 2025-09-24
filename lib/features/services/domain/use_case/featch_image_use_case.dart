import 'package:dartz/dartz.dart';
import 'package:green_souq/core/utiles/errors/failure.dart';
import 'package:green_souq/features/services/domain/entites/images_entite.dart';
import 'package:green_souq/features/services/domain/rebo/services_rebo.dart';

abstract class UseCase<Type, String> {
  Future<Either<Failure, Type>> call(String search);
}

class FeatchImageUseCase extends UseCase<List<ImagesEntite>, String> {
  final ServicesRebo servicesRebo;

  FeatchImageUseCase({required this.servicesRebo});
  @override
  Future<Either<Failure, List<ImagesEntite>>> call(String search) async {
    return await servicesRebo.featchImages(search: search);
  }
}

class NoParams {}
