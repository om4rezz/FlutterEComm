import 'dart:convert';
import 'dart:ui';

import 'package:ecomm_app/model/ad_banner.dart';
import 'package:ecomm_app/model/category.dart';
import 'package:ecomm_app/model/metal_Item.dart';
import 'package:ecomm_app/model/product.dart';
import 'package:ecomm_app/model/live_pricing.dart';
import 'package:ecomm_app/service/remote_service/remote_banner_service.dart';
import 'package:ecomm_app/service/remote_service/remote_popular_category_service.dart';
import 'package:ecomm_app/service/remote_service/remote_popular_product_service.dart';
import 'package:ecomm_app/service/remote_service/remote_live_pricing_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList =
      List<Category>.empty(growable: true).obs;
  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;
  RxBool isPopularProductLoading = false.obs;
  RxBool isLivePricingLoading = false.obs;
  RxList<LivePricingModel> livePricingList = List<LivePricingModel>.empty(growable: true).obs;

  @override
  void onInit() async {
    getAdBanners();
    getPopularCategories();
    getPopularProducts();
    getLivePricing();
    super.onInit();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);

      // call API
      var result = await RemoteBannerService().get();
      if (result != null) {
        // assign API result
        bannerList.assignAll(adBannerListFromJson(utf8.decode(result.bodyBytes)));
        // save API result to local db
      }
    } finally {
      isBannerLoading(false);
    }
  }

  void getPopularCategories() async {
    try {
      isPopularCategoryLoading(true);
      // assigning local categories before call api

      // call API
      var result = await RemotePopularCategoryService().get();
      if (result != null) {
        // assign API result
        popularCategoryList.assignAll(popularCategoryListFromJson(utf8.decode(result.bodyBytes)));
        // save API result to local db
      }
    } finally {
      isPopularCategoryLoading(false);
    }
  }

  void getPopularProducts() async {
    try {
      isPopularProductLoading(true);
      // assigning local products before call api
      // if (_localProductService.getPopularProducts().isNotEmpty) {
      //   popularProductList.assignAll(_localProductService.getPopularProducts());
      // }
      // call API
      var result = await RemotePopularProductService().get();
      if (result != null) {
        // assign API result
        popularProductList.assignAll(popularProductListFromJson(utf8.decode(result.bodyBytes)));
        // save API result to local db
        // _localProductService.assignAllPopularProducts(
        //     popularProducts: popularProductListFromJson(utf8.decode(result.bodyBytes)));
      }
    } finally {
      isPopularProductLoading(false);
    }
  }

  void getLivePricing() async {
    try {
      isLivePricingLoading(true);
      var result = await RemoteLivePricingService().get();
      if (result != null) {
        livePricingList.assignAll(livePricingListFromJson(utf8.decode(result.bodyBytes)));
      }
    } finally {
      isLivePricingLoading(false);
    }
  }

  Metal? getGold24Metal() {
    Metal gold24 = Metal(name: 'عيار 24',
        price: livePricingList[1].sell_kirat_24.toString(),
        color: Color(0xFFFFD700));
    return gold24;
  }

  Metal? getGold21Metal() {
    Metal gold21 = Metal(name: 'عيار 21',
        price: livePricingList[1].local_sell.toString(),
        color: Color(0xFFF1C40F));
    return gold21;
  }

  Metal? getGold18Metal() {
    Metal gold18 = Metal(name: 'عيار 18',
        price: livePricingList[1].sell_kirat_18.toString(),
        color: Color(0xFFE6BF3E));
    return gold18;
  }

  Metal? getSilverMetal() {
    Metal silver = Metal(name: 'فضة',
        price: livePricingList[0].local_sell.toString(),
        color: Color(0xFFC0C0C0));
    return silver;
  }
}