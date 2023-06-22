import 'package:ecomm_app/component/main_header.dart';
import 'package:ecomm_app/controller/controllers.dart';
import 'package:ecomm_app/view/home/components/carousel_slider/carousel_loading.dart';
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
          Obx(() {
            if (homeController.isBannerLoading.value) {
              return CarouselLoading();
            } else {
              return CarouselLoading();
            }
          })
        ],
      ),
    );
  }
}
