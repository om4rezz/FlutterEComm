import 'package:ecomm_app/controller/dashboard_controller.dart';
import 'package:ecomm_app/controller/home_controller.dart';
import 'package:ecomm_app/controller/product_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(ProductController());
  }
}
