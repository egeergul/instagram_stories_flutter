import 'package:case_study/app/core/utils/extensions.dart';
import 'package:case_study/app/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}