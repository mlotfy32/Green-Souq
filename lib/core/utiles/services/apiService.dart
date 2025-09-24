import 'dart:developer';

import 'package:dio/dio.dart';

class Apiservice {
  final Dio _dio;
  Apiservice(this._dio);
  //!Get Images
  Future<Map<String, dynamic>> get({
    required String baseUrl,
    required String search,
    required String endPoint,
  }) async {
    final response = await _dio.get(
      'https://api.unsplash.com/search/photos?query=seeds&client_id=3VNN_qlVDU4cXcUbrgJQxd0VbtREId2GZU61Xc2KmAc',
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    log('$baseUrl$search$endPoint');
    return response.data;
    // List<ImagesModel> images = [];
    // try {
    //   Response response = await _dio.get(
    //     '$_baerUrl$search&client_id=3VNN_qlVDU4cXcUbrgJQxd0VbtREId2GZU61Xc2KmAc',
    //     options: Options(headers: {'Content-Type': 'application/json'}),
    //   );
    //   for (var element in response.data['results']) {
    //     images.add(ImagesModel.fromJson(element));
    //   }
    //   return right(images);
    // } catch (e) {
    //   if (e is DioException) {
    //     return left(ServerFailure.fromDiorError(e));
    //   } else {
    //     return left(ServerFailure('Something went wrong please try again'));
    //   }
    // }
  }
}
