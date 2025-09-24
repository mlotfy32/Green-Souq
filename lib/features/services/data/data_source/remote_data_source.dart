import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:green_souq/core/utiles/services/apiService.dart';
import 'package:green_souq/features/services/data/models/imagesModel.dart';
import 'package:green_souq/features/services/domain/entites/images_entite.dart';

abstract class ServicesRemoteDataSource {
  Future<List<ImagesEntite>> featchImages({required String search});
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
}
