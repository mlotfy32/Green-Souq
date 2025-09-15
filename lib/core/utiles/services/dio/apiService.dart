import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:green_souq/core/utiles/services/dio/dio_factory.dart';
import 'package:green_souq/core/utiles/services/failure.dart';
import 'package:green_souq/features/services/data/imagesModel.dart';

class Apiservice {
  factory Apiservice() {
    return preferences;
  }
  Apiservice._internal();
  static final Apiservice preferences = Apiservice._internal();
  final _dio = DioFactory.getDio();
  final _baerUrl = dotenv.env['IMAGES_API'];
  //!Get Images
  Future<Either<Failure, List<ImagesModel>>> getImages({
    required String search,
  }) async {
    List<ImagesModel> images = [];
    try {
      Response response = await _dio.get(
        '$_baerUrl$search&client_id=3VNN_qlVDU4cXcUbrgJQxd0VbtREId2GZU61Xc2KmAc',
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      for (var element in response.data['results']) {
        images.add(ImagesModel.fromJson(element));
      }
      return right(images);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure('Something went wrong please try again'));
      }
    }
  }
}
