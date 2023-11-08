import 'package:ecomm_app/model/metal_Item.dart';
import 'package:flutter/material.dart';

class MetalPriceCard extends StatelessWidget {
  final Metal metalItem;

  MetalPriceCard({Key? key, required this.metalItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      shadowColor: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 130,
          height: 130,
          color: metalItem.color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                metalItem.name ?? '',
                style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold,),
              ),
              SizedBox(height: 20.0),
              Text(
                metalItem.price ?? '',
                style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}