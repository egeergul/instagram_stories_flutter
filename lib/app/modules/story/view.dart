import 'package:case_study/app/core/utils/extensions.dart';
import 'package:case_study/app/data/dummy_data/dummy_users.dart';
import 'package:case_study/app/modules/home/controller.dart';
import 'package:case_study/app/modules/home/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story/story.dart';

class StoryScreen extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  StoryScreen({super.key, required this.index});

  final int index; // The selected user's index

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.vertical,
      key: UniqueKey(),
      onDismissed: (_) => Get.to(HomeScreen()),
      child: SafeArea(
        child: StoryPageView(
          itemBuilder: (context, pageIndex, storyIndex) {
            var user = dataUsers[pageIndex + index];
            var story = user.stories[storyIndex];

            homeController.setWatched(pageIndex + index, storyIndex + 1);

            return Stack(
              children: [
                Positioned.fill(
                    child: Container(
                  color: Colors.black,
                )),
                Positioned.fill(
                    child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(story.imageUrl))),
                )),
                Padding(
                  padding: EdgeInsets.only(top: 3.0.hp, left: 4.0.wp),
                  child: Row(
                    children: [
                      Container(
                        width: 8.0.wp,
                        height: 8.0.hp,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(user.profileUrl))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.0.wp),
                        child: Text(
                          user.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
          pageLength: dataUsers.length - index,
          storyLength: (pageIndex) =>
              dataUsers[pageIndex + index].stories.length,
          onPageLimitReached: () {
            Get.to(HomeScreen());
          },
        ),
      ),
    );
  }
}
