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
}
