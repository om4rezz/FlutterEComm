import 'package:ecomm_app/model/product.dart';
import 'package:ecomm_app/view/product/components/product_card.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  const ProductGrid({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('======@@@@@@@@@@@@');
    print(products.length);
    print('======@@@@@@@@@@@@');
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductCard(
        product: products[index],
      ),
    );
  }
}
