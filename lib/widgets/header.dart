import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/widgets/small_text.dart';

import '../utils/app_constants.dart';
import '../utils/colors.dart';
import 'big_text.dart';

class Header_info extends StatelessWidget {
  const Header_info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 45, bottom: 15),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                BigText(
                  text: AppConstants.APP_NAME,
                  color: AppColors.mainColor1,
                ),
                Row(
                  children: const [
                    SmallText(
                      text: AppConstants.APP_VERSION,
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
