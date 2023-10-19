import 'dart:convert';

import 'package:hive/hive.dart';

part 'product.g.dart';

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
  final List<String> images;
  @HiveField(4)
  final double fitness;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.images,
      required this.fitness});

  factory Product.popularProductFromJson(Map<String, dynamic> data) => Product(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      images: List<String>.from(data['photos'].map((image) => image['photo'])),
      fitness: data['fitness']);

  factory Product.productFromJson(Map<String, dynamic> data) => Product(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      images: List<String>.from(data['photos'].map((image) => image['photo'])),
      fitness: data['fitness']);
}
