import 'package:ecomm_app/component/main_header.dart';
import 'package:ecomm_app/controller/controllers.dart';
import 'package:ecomm_app/model/metal_Item.dart';
import 'package:ecomm_app/view/home/components/carousel_slider/carousel_loading.dart';
import 'package:ecomm_app/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:ecomm_app/view/home/components/live_pricing/metal_price_card.dart';
import 'package:ecomm_app/view/home/components/live_pricing/metal_price_grid.dart';
import 'package:ecomm_app/view/home/components/popular_category/popular_category.dart';
import 'package:ecomm_app/view/home/components/popular_category/popular_category_loading.dart';
import 'package:ecomm_app/view/home/components/popular_product/popular_product.dart';
import 'package:ecomm_app/view/home/components/popular_product/popular_product_loading.dart';
import 'package:ecomm_app/view/home/components/live_pricing/live_pricing_card.dart';
import 'package:ecomm_app/view/home/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Obx(() {
                    if (homeController.bannerList.isNotEmpty) {
                      return CarouselSliderView(
                        bannerList: homeController.bannerList,
                      );
                    } else {
                      return CarouselLoading();
                    }
                  }),
                  SizedBox(height: 10),
                  Obx(() {
                    if (homeController.livePricingList.isEmpty) {
                      return CarouselLoading();
                    } else {
                      return MetalsPricesGrid(
                          gold24Metal: homeController.getGold24Metal()!,
                          gold21Metal: homeController.getGold21Metal()!,
                          gold18Metal: homeController.getGold18Metal()!,
                          silverMetal: homeController.getSilverMetal()!);
                    }
                  }),
                  SizedBox(height: 10),
                  const SectionTitle(title: "Popular Category"),
                  Obx(() {
                    if (homeController.popularCategoryList.isNotEmpty) {
                      return PopularCategory(
                        categories: homeController.popularCategoryList,
                      );
                    } else {
                      return PopularCategoryLoading();
                    }
                  }),
                  const SectionTitle(title: "Popular Product"),
                  Obx(() {
                    if (homeController.popularProductList.isNotEmpty) {
                      return PopularProduct(
                        popularProducts: homeController.popularProductList,
                      );
                    } else {
                      return const PopularProductLoading();
                    }
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
