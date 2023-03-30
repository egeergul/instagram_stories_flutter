import 'package:case_study/app/data/models/story.dart';

class UserModel {
  String profileUrl;
  String name;
  List<StoryModel> stories;
  int numOfStories;
  int watchedStories;
  bool completedOnce;

  UserModel(
      {required this.profileUrl,
      required this.name,
      required this.stories,
      required this.numOfStories,
      required this.watchedStories,
      required this.completedOnce});
  
  factory UserModel.fromJson(Map<String, dynamic> json) {

    List<StoryModel> stories = [];
    for (var story in json["stories"]) {
      stories.add(StoryModel.fromJson(story));
    }

    return UserModel(
      profileUrl: json["profileUrl"],
      name: json["name"], 
      stories: stories,
      numOfStories: json["numOfStories"], 
      watchedStories: json["watchedStories"],
      completedOnce: json["completedOnce"],   
    );
  }

}
