import 'package:ecomm_app/model/metal_Item.dart';
import 'package:ecomm_app/view/home/components/live_pricing/metal_price_card.dart';
import 'package:flutter/material.dart';

class MetalsPricesGrid extends StatelessWidget {
  Metal gold24Metal = Metal();
  Metal gold21Metal = Metal();
  Metal gold18Metal = Metal();
  Metal silverMetal = Metal();
   MetalsPricesGrid({Key? key, required this.gold24Metal,
    required this.gold21Metal,
    required this.gold18Metal,
    required this.silverMetal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
              children:[
                SizedBox(width: 75),
                MetalPriceCard(metalItem: gold24Metal),
                SizedBox(width: 20),
                MetalPriceCard(metalItem: gold21Metal),
              ]),
          SizedBox(height: 20),
          Row(
              children:[
                SizedBox(width: 75),
                MetalPriceCard(metalItem: gold18Metal),
                SizedBox(width: 20),
                MetalPriceCard(metalItem: silverMetal),
              ])
        ]
    );
  }
}
