import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/widgets/small_text.dart';

import '../utils/app_constants.dart';
import '../utils/colors.dart';
import 'big_text.dart';

class HeaderInfo extends StatelessWidget {
  final title;
  String subTitle;

  HeaderInfo({Key? key, required this.title, this.subTitle = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 45, bottom: 15),
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                BigText(
                  text: title,
                  color: AppColors.mainColor1,
                ),
                Row(
                  children: [
                    SmallText(
                      text: subTitle == '' ? '' : subTitle,
                      color: Colors.black54,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
