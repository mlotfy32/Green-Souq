import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:green_souq/core/utiles/services/apiService.dart';
import 'package:green_souq/features/services/data/models/disease_model.dart';
import 'package:green_souq/features/services/data/models/disease_video.dart';
import 'package:green_souq/features/services/data/models/imagesModel.dart';
import 'package:green_souq/features/services/domain/entites/disease_entite.dart';
import 'package:green_souq/features/services/domain/entites/disease_video_entite.dart';
import 'package:green_souq/features/services/domain/entites/images_entite.dart';

abstract class ServicesRemoteDataSource {
  Future<List<ImagesEntite>> featchImages({required String search});
  Future<List<DiseaseEntite>> featchDeasices({required String image});
  Future<List<DiseaseVideoEntite>> featchDeasicesVideo({
    required String diseaseName,
  });
}

class ServicesRemoteDataSourceImp extends ServicesRemoteDataSource {
  final Apiservice apiservice;

  ServicesRemoteDataSourceImp({required this.apiservice});
  @override
  Future<List<ImagesEntite>> featchImages({required String search}) async {
    final baseUrl = dotenv.env['IMAGES_API'];
    Map<String, dynamic> data = await apiservice.get(
      baseUrl: baseUrl!,
      search: search,
      endPoint: '&client_id=3VNN_qlVDU4cXcUbrgJQxd0VbtREId2GZU61Xc2KmAc',
    );
    List<ImagesEntite> images = getImagesList(data);
    return images;
  }

  List<ImagesEntite> getImagesList(Map<String, dynamic> data) {
    List<ImagesEntite> images = [];

    for (var element in data['results']) {
      images.add(ImagesModel.fromJson(element));
    }
    return images;
  }

  @override
  Future<List<DiseaseEntite>> featchDeasices({required String image}) async {
    List<DiseaseEntite> diseases = [];

    Map<String, dynamic> data = await apiservice.post(image: image);
    if (data['result']['is_plant']['binary'] == false) {
      Get.back();
      Get.snackbar('Green Souq', 'Please select a plant image.');
    }
    for (var element in data['result']['disease']['suggestions']) {
      diseases.add(DiseaseModel.fromJson(element));
    }
    return diseases;
  }

  @override
  Future<List<DiseaseVideoEntite>> featchDeasicesVideo({
    required String diseaseName,
  }) async {
    List<DiseaseVideoEntite> videos = [];
    final _baerUrl = dotenv.env['BASE_API_VIDEOS_URL'];
    final _apiKey = dotenv.env['VIDEOS_API_KEY'];

    Map<String, dynamic> data = await apiservice.getVideos(
      url:
          '$_baerUrl$diseaseName&maxResults=30&order=date&type=video&key=$_apiKey',
    );
    for (var element in data['items']) {
      videos.add(DiseaseVideoModel.fromJson(element));
    }
    return videos;
  }
}
