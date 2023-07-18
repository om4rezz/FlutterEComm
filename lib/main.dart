import 'package:ecomm_app/model/ad_banner.dart';
import 'package:ecomm_app/model/category.dart';
import 'package:ecomm_app/model/product.dart';
import 'package:ecomm_app/route/app_page.dart';
import 'package:ecomm_app/route/app_route.dart';
import 'package:ecomm_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // register adapters
  Hive.registerAdapter(AdBannerAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ProductAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPage.list,
      initialRoute: AppRoute.dashboard,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
