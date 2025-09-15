class ImagesModel {
  final String image;
  final String name;

  ImagesModel({required this.image, required this.name});
  factory ImagesModel.fromJson(data) {
    return ImagesModel(
      image: data['urls']['raw'],
      name: data['alternative_slugs']['en'],
    );
  }
}
