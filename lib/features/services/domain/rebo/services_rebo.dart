import 'package:dartz/dartz.dart';
import 'package:green_souq/core/utiles/errors/failure.dart';
import 'package:green_souq/features/services/domain/entites/disease_entite.dart';
import 'package:green_souq/features/services/domain/entites/disease_video_entite.dart';
import 'package:green_souq/features/services/domain/entites/images_entite.dart';

abstract class ServicesRebo {
  Future<Either<Failure, List<ImagesEntite>>> featchImages({
    required String search,
  });
  Future<Either<Failure, List<DiseaseEntite>>> featchDeasices({
    required String image,
  });
  Future<Either<Failure, List<DiseaseVideoEntite>>> featchDeasicesVideo({
    required String diseaseName,
  });
}
