import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:green_souq/core/utiles/errors/failure.dart';
import 'package:green_souq/features/services/data/data_source/local_data_source.dart';
import 'package:green_souq/features/services/data/data_source/remote_data_source.dart';
import 'package:green_souq/features/services/domain/entites/images_entite.dart';
import 'package:green_souq/features/services/domain/rebo/services_rebo.dart';

class ServicesReboImp extends ServicesRebo {
  final ServicesLocalDataSource servicesLocalDataSource;
  final ServicesRemoteDataSource servicesRemoteDataSource;

  ServicesReboImp({
    required this.servicesLocalDataSource,
    required this.servicesRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<ImagesEntite>>> featchImages({
    required String search,
  }) async {
    List<ImagesEntite> images;
    log('hasData $search');

    try {
      images = await servicesLocalDataSource.featchImages();
      if (images.isNotEmpty) {
        log('hasData');
        return right(images);
      }
      log('noData');

      images = await servicesRemoteDataSource.featchImages(search: search!);
      return right(images);
    } catch (e) {
      log(e.toString());

      if (e is DioException) {
        log(e.toString());

        return left(ServerFailure.fromDiorError(e));
      } else {
        log(e.toString());
        return left(ServerFailure('Something went wrong please try again'));
      }
    }
  }
}
