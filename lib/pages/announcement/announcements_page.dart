import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/joined_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/popular_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/recommended_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/data/model/activity_model.dart';
import 'package:fyp_2023_activity_enroller/data/model/announcements.dart';
import 'package:fyp_2023_activity_enroller/utils/app_constants.dart';
import 'package:fyp_2023_activity_enroller/widgets/app_column_s.dart';
import 'package:fyp_2023_activity_enroller/widgets/big_text_softwrap.dart';
import 'package:fyp_2023_activity_enroller/widgets/enrty_point.dart';
import 'package:fyp_2023_activity_enroller/widgets/header.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../data/controllers/activity_announcement_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/announcement_card_widget.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/cirular_progress.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';
import 'announcements_detail.dart';

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({super.key});

  @override
  State<AnnouncementsPage> createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  @override
  void initState() {
    Get.lazyPut(() =>
        ActivityAnnouncementController(activityAnnouncementRepo: Get.find()));
    Get.find<ActivityAnnouncementController>().getAnnouncementList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HeaderInfo(),
          Container(
            margin: EdgeInsets.only(left: Dimensions.widhth20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Announcements"),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          Expanded(child: GetBuilder<ActivityAnnouncementController>(
              builder: (activityAnnouncement) {
            return activityAnnouncement.isLoaded
                ? ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: activityAnnouncement.announcementList.length,
                    itemBuilder: (context, index) {
                      AnnouncementModel announcementModel =
                          activityAnnouncement.announcementList[index]!;

                      return Announcement_card_widget(
                          announcementModel: announcementModel, index: index);
                    })
                : CircularProgress();
          }))
        ],
      ),
      bottomNavigationBar: const EntryPoint(),
    );
  }
}
