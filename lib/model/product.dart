import 'dart:convert';

import 'package:hive/hive.dart';

List<Product> popularProductListFromJson(String val) => List<Product>.from(json
    .decode(val)['results']
    .map((val) => Product.popularProductFromJson(val)));

List<Product> productListFromJson(String val) => List<Product>.from(
    json.decode(val)['results'].map((val) => Product.productFromJson(val)));

@HiveType(typeId: 3)
class Product {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final List<String?>? images;
  @HiveField(4)
  final double fitness;
  @HiveField(5)
  final int price;
  @HiveField(6)
  final String brandId;
  @HiveField(7)
  final String metalId;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.fitness,
    required this.price,
    required this.brandId,
    required this.metalId,
  });

  factory Product.popularProductFromJson(Map<String, dynamic> data) => Product(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        images:
            List<String>.from(data['photos'].map((image) => image['photo'])),
        fitness: data['fitness'],
        price: data['price'],
        brandId: data['brand']['id'],
        metalId: data['metal_type']['id'],
      );

  factory Product.productFromJson(Map<String, dynamic> data) => Product(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        images:
            List<String>.from(data['photos'].map((image) => image['photo'])),
        fitness: data['fitness'],
        price: data['price'],
        brandId: data['brand']['id'],
        metalId: data['metal_type']['id'],
      );
}
