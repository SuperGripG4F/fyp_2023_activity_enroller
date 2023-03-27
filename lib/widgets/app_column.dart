import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fyp_2023_activity_enroller/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final int stars;
  final int comments_num;
  final String date;
  final String day;
  final String time;
  final String location;

  const AppColumn(
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
        BigText(
          text: text,
          size: Dimensions.font26,
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
                        color: AppColors.mainColor2,
                        size: 15,
                      )),
            ),
            Wrap(
              children: List.generate(
                  5 - stars,
                  (index) => Icon(
                        Icons.star_border_outlined,
                        color: AppColors.mainColor2,
                        size: 15,
                      )),
            ),
            SizedBox(
              width: Dimensions.widhth10,
            ),
            SmallText(text: "$comments_num comments"),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconAndTextWidget(
                icon: Icons.location_on,
                text: location,
                iconColor: AppColors.mainColor5),
          ],
        ),
      ],
    );
  }
}
