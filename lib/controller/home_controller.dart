import 'package:ecomm_app/model/ad_banner.dart';
import 'package:ecomm_app/model/category.dart';
import 'package:ecomm_app/model/product.dart';
import 'package:ecomm_app/service/remote_service/remote_banner_service.dart';
import 'package:ecomm_app/service/remote_service/remote_popular_category_service.dart';
import 'package:ecomm_app/service/remote_service/remote_popular_product_service.dart';
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

  @override
  void onInit() async {
    getAdBanners();
    getPopularCategories();
    getPopularProducts();
    super.onInit();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);

      // call API
      var result = await RemoteBannerService().get();
      if (result != null) {
        // assign API result
        bannerList.assignAll(adBannerListFromJson(result.body));
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
        popularCategoryList.assignAll(popularCategoryListFromJson(result.body));
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
        popularProductList.assignAll(popularProductListFromJson(result.body));
        // save API result to local db
        // _localProductService.assignAllPopularProducts(
        //     popularProducts: popularProductListFromJson(result.body));
      }
    } finally {
      isPopularProductLoading(false);
    }
  }
}
