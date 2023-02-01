import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fyp_2023_activity_enroller/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumnSmall extends StatelessWidget {
  final String text;
  final int stars;
  final int comments_num;
  final String date;
  final String day;
  final String time;
  final String location;

  const AppColumnSmall(
      {super.key,
      required this.text,
      required this.stars,
      required this.comments_num,
      required this.date,
      required this.day,
      required this.time,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.height10,
        ),
        BigText(
          text: text,
          size: Dimensions.font20,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  stars,
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.mainColor1,
                        size: 15,
                      )),
            ),
            SizedBox(
              width: Dimensions.widhth10,
            ),
            SmallText(text: stars.toString()),
            SizedBox(
              width: Dimensions.widhth10,
            ),
            SmallText(text: comments_num.toString() + " comments"),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconAndTextWidget(
                icon: Icons.calendar_month,
                text: date,
                iconColor: AppColors.mainColor3),
            IconAndTextWidget(
                icon: Icons.event, text: day, iconColor: AppColors.mainColor4),
            IconAndTextWidget(
                icon: Icons.schedule,
                text: time,
                iconColor: AppColors.mainColor5),
          ],
        ),
      ],
    );
  }
}
