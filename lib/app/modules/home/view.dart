import 'package:case_study/app/core/utils/extensions.dart';
import 'package:case_study/app/modules/home/controller.dart';
import 'package:case_study/app/modules/home/widgets/user_item.dart';
import 'package:case_study/app/modules/story/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/styles.dart';

class HomeScreen extends StatelessWidget {
  /// The control of the home screen
  final homeController = Get.find<HomeController>();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          actionsIconTheme: IconThemeData(color: Colors.black, size: 7.0.wp),
          // ignore: deprecated_member_use
          backwardsCompatibility: true,
          actions: const [
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.message_outlined,
                  color: Colors.black,
                ))
          ],
          title: Text("Instagram", style: textBoldSize20),
        ),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 12.0.hp,
              child: ListView.builder(
                  itemCount: homeController.getNoOfUsers(),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => StoryScreen(index: index),
                            // VideoApp(videoURL: "assets/v1.mp4"),

                            duration: const Duration(milliseconds: 100),
                            transition: Transition.downToUp);
                      },
                      child: UserItem(userData: homeController.getUser(index)),
                    );
                  }),
            ),
            const Divider(),
            Expanded(
              flex: 1,
              child: Center(
                  child: Text(
                "Posts Feed",
                style: textBoldSize20,
              )),
            ),
          ],
        )));
  }
}
