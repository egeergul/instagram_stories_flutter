import 'package:case_study/app/modules/home/home_screen.dart';
import 'package:case_study/app/modules/story/widgets/video_player.dart';
import 'package:case_study/app/modules/story/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'story_package/story.dart';
import '../../controllers/controller.dart';

class StoryScreen extends StatefulWidget {
  StoryScreen({super.key, required this.index});
  int index;

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final storiesController = Get.find<StoriesController>();

  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.resume);
  }

  @override
  void dispose() {
    indicatorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      // To close stories with a pull down
      direction: DismissDirection.vertical,
      key: UniqueKey(),
      onDismissed: (_) => Get.to(HomeScreen()),
      child: SafeArea(
        child: Scaffold(
          body: StoryPageView(
            itemBuilder: (context, pageIndex, storyIndex) {
              var user = storiesController.users[pageIndex];
              var story = user.stories[storyIndex];
        
              // As the item is being built (the story of user withc pageIndex,
              // and story number of storyIndex), set that specific story as viewed
              storiesController.setWatched(pageIndex, storyIndex + 1);
              
              return Stack(
                children: [
                  Positioned.fill(child: Container(color: Colors.black,)),
                  !story.isVideo ?  
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(story.imageUrl)
                            )
                        ),
                      )
                    ) : Center(),
                  UserInfo(user: user),
                ],
              );
            },
            pageLength: storiesController.users.length, // Total number of users
            storyLength: (pageIndex) => storiesController.users[pageIndex].stories.length, // Each user's story no
            onPageLimitReached: () {
              Get.to(HomeScreen()); // When the last user's last story is viewed
              // go bavk to the home screen.
            },
            initialPage: widget.index, // The selected user's index
            initialStoryIndex: (index) {
              // if the user's all stories have been viewed before, start again 
              // from the first story of that user
              if (storiesController.users[index].completedOnce) return 0;
              // if not, continue from where you left off
              return storiesController.users[index].watchedStories;
            },
        
            gestureItemBuilder: (context, pageIndex, storyIndex) {
              return Stack(children: [
                if (storiesController.getUser(pageIndex).stories[storyIndex].isVideo)
                  Center( 
                    child: VideoPlayerWidget( 
                      videoURL: storiesController.getUser(pageIndex).stories[storyIndex].imageUrl,
                      indicatorAnimationController: indicatorAnimationController,
                    )
                  ),
              ]);
            },
        
            indicatorAnimationController: indicatorAnimationController,
            showShadow: true
          ),
        ),
      ),
    );
  }
}
