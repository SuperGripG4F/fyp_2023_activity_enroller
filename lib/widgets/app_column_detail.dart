import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fyp_2023_activity_enroller/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'expandable_text_widget.dart';
import 'icon_and_text_widget.dart';

class AppColumnDetail extends StatelessWidget {
  final int pageId;

  final String text;
  final int stars;
  final int comments_num;
  final String date;
  final String day;
  final String time;
  final String location;

  const AppColumnDetail(
      {super.key,
      required this.text,
      required this.stars,
      required this.comments_num,
      required this.date,
      required this.day,
      required this.time,
      required this.location,
      required this.pageId});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
                width: Dimensions.screenWidth - Dimensions.widhth45,
                child: Text(
                  text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: const Color(0xFF332d2b),
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.w400),
                ))
          ],
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
            SmallText(text: comments_num.toString() + " comments"),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            IconAndTextWidget(
                icon: Icons.calendar_month,
                text: date,
                iconColor: AppColors.mainColor3),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            IconAndTextWidget(
                icon: Icons.event, text: day, iconColor: AppColors.mainColor4),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            IconAndTextWidget(
                icon: Icons.schedule,
                text: time,
                iconColor: AppColors.mainColor5),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        //location
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconAndTextWidget(
                icon: Icons.location_on,
                text: location,
                iconColor: AppColors.mainColor5),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        BigText(
          text: "Introduce",
          size: Dimensions.font20,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Container(
          child: ExpandableTextWidget(
              text:
                  "Here is the introduction to the activity detail page. It is a expandable text widget, you can put a lot of words here. like ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt"),
        ),
      ],
    );
  }
}
