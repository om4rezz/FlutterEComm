import 'dart:convert';
import 'package:hive/hive.dart';

part 'category.g.dart';

List<Category> popularCategoryListFromJson(String val) =>
    List<Category>.from(json
        .decode(val)['results']
        .map((category) => Category.popularCategoryFromJson(category)));

List<Category> categoryListFromJson(String val) => List<Category>.from(json
    .decode(val)['results']
    .map((category) => Category.categoryFromJson(category)));

@HiveType(typeId: 2)
class Category {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? photo;

  Category({required this.id, required this.name, required this.photo});

  factory Category.popularCategoryFromJson(Map<String, dynamic> data) =>
      Category(
          id: data['id'],
          name: data['name'],
          photo: data['photo']);

  factory Category.categoryFromJson(Map<String, dynamic> data) => Category(
      id: data['id'],
      name: data['name'],
      photo: data['photo']);
}
