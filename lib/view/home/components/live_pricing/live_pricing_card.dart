import 'package:flutter/material.dart';
import 'package:ecomm_app/model/live_pricing.dart';

class LivePricingCard extends StatelessWidget {
  final List<LivePricingModel> livePricesList;

  const LivePricingCard({Key? key, required this.livePricesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ClipRRect(
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Column(
                children: [
                  Material(
                    elevation: 10,
                    shadowColor: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('شراء',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            const SizedBox(width: 80.0),
                            Text('بيع',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            const SizedBox(width: 200.0)
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(livePricesList[1].buy_kirat_24.toString()),
                            const SizedBox(width: 75.0),
                            Text(livePricesList[1].sell_kirat_24.toString()),
                            const SizedBox(width: 120.0),
                            Text('ذهب ٢٤',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            const SizedBox(width: 10.0)
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(livePricesList[1].local_sell.toString()),
                              const SizedBox(width: 55.0),
                              Text(livePricesList[1].local_sell.toString()),
                              const SizedBox(width: 110.0),
                              Text('ذهب ٢١',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              const SizedBox(width: 10.0)
                            ]),
                        const SizedBox(height: 15.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(livePricesList[1].buy_kirat_18.toString()),
                              const SizedBox(width: 80.0),
                              Text(livePricesList[1].sell_kirat_18.toString()),
                              const SizedBox(width: 120.0),
                              Text('ذهب ١٨',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              const SizedBox(width: 10.0)
                            ]),
                        const SizedBox(height: 15.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(livePricesList[0].local_buy.toString()),
                              const SizedBox(width: 75.0),
                              Text(livePricesList[0].local_sell.toString()),
                              const SizedBox(width: 135.0),
                              Text('فضة',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              const SizedBox(width: 18.0)
                            ]),
                        const SizedBox(width: 10.0)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
