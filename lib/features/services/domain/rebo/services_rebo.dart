import 'package:dartz/dartz.dart';
import 'package:green_souq/core/utiles/errors/failure.dart';
import 'package:green_souq/features/services/domain/entites/images_entite.dart';

abstract class ServicesRebo {
  Future<Either<Failure, List<ImagesEntite>>> featchImages({
    required String search,
  });
}
