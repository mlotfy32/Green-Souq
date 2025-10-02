import 'package:green_souq/features/services/domain/entites/disease_video_entite.dart';

class DiseaseVideoModel extends DiseaseVideoEntite {
  DiseaseVideoModel({
    required super.videoId,
    required super.publishedAt,
    required super.title,
    required super.channelTitle,
    required super.channelLogo,
  });
  factory DiseaseVideoModel.fromJson(data) {
    return DiseaseVideoModel(
      videoId: data['id']['videoId'],
      publishedAt: data['snippet']['publishedAt'],
      title: data['snippet']['title'],
      channelTitle: data['snippet']['channelTitle'],
      channelLogo: data['snippet']['thumbnails']['default']['url'],
    );
  }
}
