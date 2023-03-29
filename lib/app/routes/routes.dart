import 'package:get/get.dart';

import '../modules/home/view.dart';

class RouteClass {
  static String home = "/";

  static String getHomeRoute() => home;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => HomeScreen()),
  ];
}
