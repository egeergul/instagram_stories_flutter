import 'package:case_study/app/data/models/story.dart';
import 'package:case_study/app/data/models/user.dart';

const pps = [
  "assets/images/pp1.jpg",
  "assets/images/pp2.jpg",
  "assets/images/pp3.jpg",
  "assets/images/pp4.jpg",
  "assets/images/pp5.jpg",
  "assets/images/pp6.jpg",
  "assets/images/pp7.jpg",
];

const names = [
  "Sponge Bob",
  "Patrick Star",
  "Squidward",
  "Gary",
  "Mr. Krabs",
  "Sandy Cheeks",
  "Larry Lobster"
];

const user1URLs = [
  "https://www.xtrafondos.com/wallpapers/vertical/bob-esponja-minimalista-4380.jpg",
  "https://w0.peakpx.com/wallpaper/391/386/HD-wallpaper-qt-spongebob-bob-sponge-thumbnail.jpg",
  "https://i.pinimg.com/736x/ac/13/37/ac1337d6a2a54a27bab644dc665ab44e.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBH9cIs-pV9M0O6VEsdcpPOQuSOmxG6iWerw&usqp=CAU",
];

const user2URLs = [
  "https://m.media-amazon.com/images/M/MV5BYmNhZGIwYjYtYjViMi00NmJlLWFjOTUtNTBlYzgwMzgyYTkyXkEyXkFqcGdeQXVyMTM1NTIzOTI1._V1_UY1200_CR473,0,630,1200_AL_.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTadYPE9aEFCPZr61bCKDajgLOsUXUNoTqD90glXoK9uuAfgVFvdLUYWxw7C5ZIPl4YWgM&usqp=CAU",
  "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71VRsCqQ+LL._AC_UY1000_.jpg",
  "https://www.xtrafondos.com/en/descargar.php?id=4359&vertical=1",
];

const user3URLs = [
  "https://drawinghowtodraw.com/stepbystepdrawinglessons/wp-content/uploads/2009/08/squidward-square.png",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-OjYX28aD5h-C9p0F16zGMGuagV2dm1QseImmPc77pCxZ7oIAzAQ92LLdNVBxOZWVfMQ&usqp=CAU",
];

const user4URLs = [
  "https://www.xtrafondos.com/wallpapers/vertical/bob-esponja-un-heroe-al-rescate-4382.jpg",
  "https://www.xtrafondos.com/en/descargar.php?id=4384&vertical=1",
  "https://www.xtrafondos.com/wallpapers/vertical/gary-y-bob-esponja-en-un-heroe-al-rescate-4381.jpg",
  "https://w0.peakpx.com/wallpaper/849/1011/HD-wallpaper-gary-spongebob.jpg"
];

const user5URLs = [
  "https://static.wikia.nocookie.net/69867056-953a-435b-805c-c1704424540b/scale-to-width/370",
  "https://w0.peakpx.com/wallpaper/163/625/HD-wallpaper-iphone-12-mr-krab-cartoon-crab-iphone-spongebob-spongebob-squarepants.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgSEvT73ob73D-JPy7s5SsUZRFKyAvRKx-SWtMOAbAOeS-OkSXTwYD6zqPKGsRwGAe9iQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx3br7NCalCYyhuuXY_8RYQZXM2QpGV3QgWl8euZDKRKvu4pJUOROYFej4I2bauDOEbow&usqp=CAU",
];

const user6URLs = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-juRJ195C3NtKyQuJ3xux3VeRA-LiQiNeJmaIkwbacqnhtznWoPDy2_QqrkbiePSPbQQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxLXYwVPuY02pvdBpompy8USnBCIYFvipzjg0VEaUu3dj8ZrsYB4oXIXDT8zgdfqrotbQ&usqp=CAU"
];
const user7URLs = [
  "https://i.pinimg.com/474x/b8/4c/90/b84c9069ba263ed4ddc121360fcde06c.jpg",
  "https://static.wikia.nocookie.net/spongebob/images/f/f6/200px-Larry_the_Lobster.svg.png/revision/latest?cb=20201121143957&path-prefix=id",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvZ4SzsOOJxduyeRx-33G5u3hxM15ZwVg_kOm3VtVt5jmxBOy0Yoo0d3_apfDf57wumCs&usqp=CAU"
];

final dataUsers = [
  UserModel(
      profileUrl: pps[0],
      name: names[0],
      numOfStories: 3,
      watchedStories: 0,
      completedOnce: false,
      stories: [
        StoryModel(imageUrl: user1URLs[0], isVideo: false),
        StoryModel(imageUrl: user1URLs[1], isVideo: false),
        StoryModel(imageUrl: "assets/v1.mp4", isVideo: true),
      ]),
  UserModel(
      profileUrl: pps[1],
      name: names[1],
      numOfStories: 4,
      watchedStories: 0,
      completedOnce: false,
      stories: [
        StoryModel(imageUrl: user2URLs[0], isVideo: false),
        StoryModel(imageUrl: user2URLs[1], isVideo: false),
        StoryModel(imageUrl: "assets/v2.mp4", isVideo: true),
        StoryModel(imageUrl: user2URLs[3], isVideo: false),
      ]),
  UserModel(
      profileUrl: pps[2],
      name: names[2],
      numOfStories: 2,
      completedOnce: false,
      watchedStories: 0,
      stories: [
        StoryModel(imageUrl: user3URLs[0], isVideo: false),
        StoryModel(imageUrl: user3URLs[1], isVideo: false),
      ]),
  UserModel(
      profileUrl: pps[3],
      name: names[3],
      numOfStories: 3,
      completedOnce: false,
      watchedStories: 0,
      stories: [
        StoryModel(imageUrl: user4URLs[0], isVideo: false),
        StoryModel(imageUrl: user4URLs[1], isVideo: false),
        StoryModel(imageUrl: user4URLs[2], isVideo: false),
      ]),
  UserModel(
      profileUrl: pps[4],
      name: names[4],
      numOfStories: 4,
      completedOnce: false,
      watchedStories: 0,
      stories: [
        StoryModel(imageUrl: user5URLs[0], isVideo: false),
        StoryModel(imageUrl: user5URLs[1], isVideo: false),
        StoryModel(imageUrl: user5URLs[2], isVideo: false),
        StoryModel(imageUrl: user5URLs[3], isVideo: false),
      ]),
  UserModel(
      profileUrl: pps[5],
      name: names[5],
      numOfStories: 2,
      completedOnce: false,
      watchedStories: 0,
      stories: [
        StoryModel(imageUrl: user6URLs[0], isVideo: false),
        StoryModel(imageUrl: user6URLs[1], isVideo: false),
      ]),
  UserModel(
      profileUrl: pps[6],
      name: names[6],
      numOfStories: 3,
      completedOnce: false,
      watchedStories: 0,
      stories: [
        StoryModel(imageUrl: user7URLs[0], isVideo: false),
        StoryModel(imageUrl: user7URLs[1], isVideo: false),
        StoryModel(imageUrl: user7URLs[2], isVideo: false),
      ]),
];
