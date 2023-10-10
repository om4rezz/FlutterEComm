import 'dart:convert';
import 'package:hive/hive.dart';

part 'ad_banner.g.dart';

List<AdBanner> adBannerListFromJson(String value) => List<AdBanner>.from(
    json.decode(value)['photos'].map((banner) => AdBanner.fromJson(banner)));

@HiveType(typeId: 1)
class AdBanner {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String image;

  AdBanner({required this.id, required this.image});

  factory AdBanner.fromJson(Map<String, dynamic> data) => AdBanner(
        id: data['id'],
        image: data['url'],
      );
}
