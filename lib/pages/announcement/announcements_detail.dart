import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/activity_announcement_controller.dart';
import 'package:fyp_2023_activity_enroller/data/model/announcements.dart';
import 'package:fyp_2023_activity_enroller/utils/app_constants.dart';
import 'package:fyp_2023_activity_enroller/widgets/big_text_softwrap.dart';
import 'package:fyp_2023_activity_enroller/widgets/header.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../../widgets/enrty_point.dart';

class AnnouncementsDetailPage extends StatelessWidget {
  final int index;

  AnnouncementsDetailPage({required this.index});

  @override
  Widget build(BuildContext context) {
    final announcementModel =
        Get.find<ActivityAnnouncementController>().announcementList[index];

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                BackButton(),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 350,
                      padding: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                          width: 1.0,
                          color: AppColors.textColor,
                        ),
                      )),
                      child: BigTextSoftWrap(
                        text: announcementModel.title!,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                          width: 1.0,
                          color: AppColors.textColor,
                        ),
                      )),
                      child: SmallText(
                        text: announcementModel.content!,
                        color: AppColors.BigTextColor,
                        size: 18,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
