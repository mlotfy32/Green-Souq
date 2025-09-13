class UserModel {
  final int phone;
  final String name;
  final String password;
  final String image;
  final String address;
  final int postCode;

  UserModel({
    required this.phone,
    required this.name,
    required this.password,
    required this.image,
    required this.address,
    required this.postCode,
  });
  factory UserModel.fromJson(data) {
    return UserModel(
      phone: data['phone'],
      name: data['name'],
      password: data['password'],
      image: data['image'],
      address: data['address'],
      postCode: data['postCode'],
    );
  }
}
