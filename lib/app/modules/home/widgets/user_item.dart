import 'package:case_study/app/core/utils/colors.dart';
import 'package:case_study/app/core/utils/extensions.dart';
import 'package:case_study/app/core/utils/styles.dart';
import 'package:case_study/app/data/models/user.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key, required this.userData});

  final UserModel
      userData; // The data of the user that is wished to be displayed

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 4.0.wp),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: !userData.completedOnce // if all the stories of the
                      // user has been viewed even once, make its background grey
                      ? const LinearGradient(colors: [
                          purple,
                          pink,
                          deepPink,
                          yellow,
                          orange,
                          red,
                          blue
                        ], begin: Alignment.bottomLeft, end: Alignment.topRight)
                      : const LinearGradient(
                          colors: [Colors.grey, Colors.black12],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight)),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                child: CircleAvatar(
                  radius: 37,
                  backgroundImage: AssetImage(userData.profileUrl),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                userData.name,
                style: textSize8,
              ),
            )
          ],
        ));
  }
}
