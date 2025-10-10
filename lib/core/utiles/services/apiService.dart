
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
      '$baseUrl$search$endPoint',
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getVideos({required String url}) async {
    final response = await _dio.get(
      url,
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String image,
    // required String baseUrl,
    // required String search,
    // required String endPoint,
  }) async {
    final response = await _dio.post(
      data: {
        "images": "$image",
        "latitude": 49.207,
        "longitude": 16.608,
        "similar_images": true,
      },
      'https://crop.kindwise.com/api/v1/identification?details=common_names,type,taxonomy,eppo_code,eppo_regulation_status,gbif_id,image,images,wiki_url,wiki_description,treatment,description,symptoms,severity,spreading&language=en',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          "Api-Key": "tQHcKy29mVKjZOHovZkFhDBjmFJbOJKQZLB6qXBUmrbdSIxo9j",
        },
      ),
    );
    return response.data;
  }
}
