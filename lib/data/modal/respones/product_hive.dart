import 'package:hive/hive.dart';

part 'product_hive.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final String imageCover;

  @HiveField(4)
  final double ratingsAverage;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageCover,
    required this.ratingsAverage,
  });
}
