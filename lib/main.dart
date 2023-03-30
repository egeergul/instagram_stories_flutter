import 'package:case_study/app/controllers/controller.dart';
import 'package:case_study/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()  {
  Get.put( StoriesController());
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
    );
  }
}
