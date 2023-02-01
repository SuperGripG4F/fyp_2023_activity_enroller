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

  const AppColumn({super.key, required this.text});

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
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.mainColor1,
                        size: 15,
                      )),
            ),
            SizedBox(
              width: Dimensions.widhth10,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: Dimensions.widhth10,
            ),
            SmallText(text: "1287 comments"),
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
                text: "5-2-2023",
                iconColor: AppColors.mainColor3),
            IconAndTextWidget(
                icon: Icons.event,
                text: "Mon",
                iconColor: AppColors.mainColor4),
            IconAndTextWidget(
                icon: Icons.schedule,
                text: "14:00",
                iconColor: AppColors.mainColor5),
          ],
        ),
        SizedBox(
          height: Dimensions.height5,
        ),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconAndTextWidget(
                icon: Icons.location_on,
                text: "循道衛理中心愛秩序灣",
                iconColor: AppColors.mainColor5),
          ],
        ),
        SizedBox(
          height: Dimensions.height5,
        ),
      ],
    );
  }
}
