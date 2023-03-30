import 'package:case_study/app/modules/home/binding.dart';
import 'package:case_study/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:flutter_video_view/flutter_video_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Codeway Case Study',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: RouteClass.getHomeRoute(),
      getPages: RouteClass.routes,
      initialBinding: HomeBinding(),
    );
  }
}
