import 'package:dartz/dartz.dart';
import 'package:green_souq/core/utiles/errors/failure.dart';
import 'package:green_souq/features/services/domain/entites/disease_entite.dart';
import 'package:green_souq/features/services/domain/rebo/services_rebo.dart';

abstract class UseCase {
  Future<Either<Failure, List<DiseaseEntite>>> call(String image);
}

class FeatchDiseaseUsecase extends UseCase {
  final ServicesRebo servicesRebo;

  FeatchDiseaseUsecase({required this.servicesRebo});
  @override
  Future<Either<Failure, List<DiseaseEntite>>> call(String image) async {
    return await servicesRebo.featchDeasices(image: image);
  }
}
