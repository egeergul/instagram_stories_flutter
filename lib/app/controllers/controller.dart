import 'dart:convert';
import 'package:case_study/app/data/models/user.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class StoriesController extends GetxController {
  StoriesController();

  // Properties
  final isInit = false.obs; // observable variable to notify that controller has been initialized
  final users = <UserModel>[].obs; /// The list of users

  /// A function to read the json data from assets folder and return it as a list of objects.
  Future<List<UserModel>> readUsers()async {
    var users = <UserModel>[];
    String raw = await rootBundle.loadString('assets/dummy_users.json');
    final data = json.decode(raw)["users"];

    data.forEach((e){
      users.add(UserModel.fromJson(e));
    });
    return users;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    // Since the read users function is async, we need to wait it.
    users
        .assignAll(await readUsers()); // initialize the users list using the dummy data
    isInit.value = true; // when the async fcn returns, set the isInit flag as true
  }

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

}
