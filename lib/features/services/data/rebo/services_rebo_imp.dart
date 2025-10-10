import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:green_souq/core/utiles/errors/failure.dart';
import 'package:green_souq/features/services/data/data_source/remote_data_source.dart';
import 'package:green_souq/features/services/domain/entites/disease_entite.dart';
import 'package:green_souq/features/services/domain/entites/disease_video_entite.dart';
import 'package:green_souq/features/services/domain/entites/images_entite.dart';
import 'package:green_souq/features/services/domain/rebo/services_rebo.dart';

class ServicesReboImp extends ServicesRebo {
  final ServicesRemoteDataSource servicesRemoteDataSource;

  ServicesReboImp({required this.servicesRemoteDataSource});
  @override
  Future<Either<Failure, List<ImagesEntite>>> featchImages({
    required String search,
  }) async {
    List<ImagesEntite> images;

    try {
      images = await servicesRemoteDataSource.featchImages(search: search);
      return right(images);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure('Something went wrong please try again'));
      }
    }
  }

  @override
  Future<Either<Failure, List<DiseaseEntite>>> featchDeasices({
    required String image,
  }) async {
    try {
      List<DiseaseEntite> diseases;
      diseases = await servicesRemoteDataSource.featchDeasices(image: image);
      return right(diseases);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure('Something went wrong please try again'));
      }
    }
  }

  @override
  Future<Either<Failure, List<DiseaseVideoEntite>>> featchDeasicesVideo({
    required String diseaseName,
  }) async {
    try {
      List<DiseaseVideoEntite> videos;
      videos = await servicesRemoteDataSource.featchDeasicesVideo(
        diseaseName: diseaseName,
      );
      return right(videos);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure('Something went wrong please try again'));
      }
    }
  }
}
