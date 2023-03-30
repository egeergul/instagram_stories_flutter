import 'package:get/get.dart';

import '../modules/home/home_screen.dart';

class RouteClass {
  static String home = "/";

  static String getHomeRoute() => home;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => HomeScreen()),
  ];
}
