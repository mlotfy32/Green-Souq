import 'package:hive_flutter/hive_flutter.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 1)
class CartModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String amount;
  @HiveField(2)
  final String price;
  @HiveField(3)
  final String servicesType;
  @HiveField(4)
  final String iamgeUrl;

  CartModel({
    required this.name,
    required this.amount,
    required this.price,
    required this.servicesType,
    required this.iamgeUrl,
  });
}
