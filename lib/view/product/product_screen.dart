import 'package:ecomm_app/component/main_header.dart';
import 'package:ecomm_app/controller/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecomm_app/view/product/components/product_grid.dart';
import 'package:ecomm_app/view/product/components/product_loading_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(child: Obx(() {
            if (productController.isProductLoading.value) {
              return const ProductLoadingGrid();
            } else {
              if (productController.productList.isNotEmpty) {
                return ProductGrid(products: productController.productList);
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/product_not_found.png'),
                    const SizedBox(height: 10),
                    const Text('Products Not Found!')
                  ],
                );
              }
            }
          }))
        ],
      ),
    );
  }
}
