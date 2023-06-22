import 'package:ecomm_app/route/app_route.dart';
import 'package:ecomm_app/view/dashboard/dashboard_binding.dart';
import 'package:ecomm_app/view/dashboard/dashboard_screen.dart';
import 'package:get/route_manager.dart';

class AppPage {
  static var list = [
    GetPage(
      name: AppRoute.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
  ];
}
