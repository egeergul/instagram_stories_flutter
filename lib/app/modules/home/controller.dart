import 'package:case_study/app/data/dummy_data/dummy_users.dart';
import 'package:case_study/app/data/models/user.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  /// The list of users
  final users = <UserModel>[].obs;

  /// The setWatched method sets [userIndex] and [storyIndex] to update the users
  /// list. The [storyIndex]th story of the user with [userIndex] is set as viewed.
  /// When all the stories of the user has been viewed, flags the completedOnce
  /// attribute of user as true.
  void setWatched(int userIndex, int storyIndex) {
    users[userIndex].watchedStories = storyIndex;
    if (users[userIndex].watchedStories == users[userIndex].numOfStories) {
      users[userIndex].completedOnce = true;
    }
  }

  int getNoOfUsers() {
    /// The number of users
    return users.length;
  }

  UserModel getUser(int index) {
    /// The user distinguished with its position in the users list
    return users[index];
  }

  @override
  void onInit() {
    super.onInit();
    users
        .assignAll(dataUsers); // initialize the users list using the dummy data
  }
}
