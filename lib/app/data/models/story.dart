class StoryModel {
  String imageUrl;
  bool isVideo;

  StoryModel({
    required this.imageUrl,
    required this.isVideo,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
    imageUrl: json["imageUrl"],
    isVideo: json["isVideo"],   
  );
}
