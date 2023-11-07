
import 'dart:convert';
import 'package:hive/hive.dart';

List<LivePricingModel> livePricingListFromJson(String val) =>
    List<LivePricingModel>.from(json
        .decode(val)['results']
        .map((livePrices) => LivePricingModel.livePricingFromJson(livePrices)));

@HiveType(typeId: 5)
class LivePricingModel {
  @HiveField(0)
  final String? type;
  @HiveField(1)
  final String? local_sell;
  @HiveField(2)
  final String? local_buy;
  @HiveField(3)
  final String? world_sell;
  @HiveField(4)
  final String? world_buy;
  @HiveField(5)
  final bool? old;
  @HiveField(6)
  final String? created_at;
  @HiveField(7)
  final int? buy_kirat_24;
  @HiveField(8)
  final int? buy_kirat_18;
  @HiveField(9)
  final int? sell_kirat_24;
  @HiveField(10)
  final int? sell_kirat_18;

  LivePricingModel({required this.type, required this.local_sell, required this.local_buy,
    required this.world_sell, required this.world_buy, required this.old,
    required this.created_at, required this.buy_kirat_24, required this.buy_kirat_18,
    required this.sell_kirat_24, required this.sell_kirat_18});

  factory LivePricingModel.livePricingFromJson(Map<String, dynamic> data) =>
      LivePricingModel(
          type: data['type'],
          local_sell: data['local_sell'],
          local_buy: data['local_buy'],
          world_sell: data['world_sell'],
          world_buy: data['world_buy'],
          old: data['old'],
          created_at: data['created_at'],
          buy_kirat_24: data['buy_kirat_24'],
          buy_kirat_18: data['buy_kirat_18'],
          sell_kirat_24: data['sell_kirat_24'],
          sell_kirat_18: data['sell_kirat_18']);

}