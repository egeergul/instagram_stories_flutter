
import 'package:case_study/app/data/dummy_data/dummy_users.dart';
import 'package:case_study/app/modules/home/controller.dart';
import 'package:case_study/app/modules/home/view.dart';
import 'package:case_study/app/modules/story/widgets/video_player.dart';
import 'package:case_study/app/modules/story/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'story_package/story.dart';

class StoryScreen extends StatefulWidget {
  StoryScreen({super.key, required this.index});
  int index;

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      // To close stories with a pull down
      direction: DismissDirection.vertical,
      key: UniqueKey(),
      onDismissed: (_) => Get.to(HomeScreen()),
      child: SafeArea(
        child: StoryPageView(
            itemBuilder: (context, pageIndex, storyIndex) {
              var user = dataUsers[pageIndex];
              var story = user.stories[storyIndex];

              // As the item is being built (the story of user withc pageIndex,
              // and story number of storyIndex), set that specific story as viewed
              homeController.setWatched(pageIndex, storyIndex + 1);

              return Stack(
                children: [
                  Positioned.fill(child: Container(color: Colors.black,)),
                  story.isVideo
                      ? VideoPlayerWidget( videoURL: story.imageUrl)
                      : Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(story.imageUrl)
                                )
                            ),
                          )
                        ),
                  UserInfo(user: user)
                ],
              );
            },
            pageLength: dataUsers.length, // Total number of users
            storyLength: (pageIndex) => dataUsers[pageIndex].stories.length, // Each user's story no
            onPageLimitReached: () {
              Get.to(HomeScreen()); // When the last user's last story is viewed
              // go bavk to the home screen.
            },
            initialPage: widget.index, // The selected user's index
            initialStoryIndex: (index) {
              // if the user's all stories have been viewed before, start again 
              // from the first story of that user
              if (homeController.users[index].completedOnce) return 0;

              // if not, continue from where you left off
              return homeController.users[index].watchedStories;
            },
            showShadow: true),
      ),
    );
  }
}
