import 'package:dartz/dartz.dart';
import 'package:green_souq/core/utiles/errors/failure.dart';
import 'package:green_souq/features/services/domain/entites/disease_video_entite.dart';
import 'package:green_souq/features/services/domain/rebo/services_rebo.dart';

abstract class UseCase {
  Future<Either<Failure, List<DiseaseVideoEntite>>> call({
    required String diseaseName,
  });
}

class FeatchDiseaseVideoUseCase extends UseCase {
  final ServicesRebo servicesRebo;

  FeatchDiseaseVideoUseCase({required this.servicesRebo});

  @override
  Future<Either<Failure, List<DiseaseVideoEntite>>> call({
    required String diseaseName,
  }) {
    return servicesRebo.featchDeasicesVideo(diseaseName: diseaseName);
  }
}
