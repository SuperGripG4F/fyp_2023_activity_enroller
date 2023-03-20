import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/joined_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/popular_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/recommended_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/data/model/activity_model.dart';
import 'package:fyp_2023_activity_enroller/utils/app_constants.dart';
import 'package:fyp_2023_activity_enroller/widgets/app_column_s.dart';
import 'package:fyp_2023_activity_enroller/widgets/enrty_point.dart';
import 'package:fyp_2023_activity_enroller/widgets/header.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({super.key});

  @override
  State<AnnouncementsPage> createState() => _AnnouncementsPage();
}

class _AnnouncementsPage extends State<AnnouncementsPage> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!; //not going to be null
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header_info(),
          Container(
            margin: EdgeInsets.only(left: Dimensions.widhth20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Announcements"),
                SizedBox(
                  width: Dimensions.widhth10,
                ),
              ],
            ),
          ),
          //list of food and images section
          GetBuilder<JoinedActivityController>(builder: (joinedActivity) {
            return joinedActivity.isLoaded
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: joinedActivity.joinedActivityList.length,
                    itemBuilder: (context, index) {
                      ActivityModel activityModel =
                          joinedActivity.joinedActivityList[index]!;
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getAnnouncementDetail(index));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: Dimensions.widhth20,
                              right: Dimensions.widhth20,
                              bottom: Dimensions.height10),
                          child: Row(
                            children: [
                              Container(
                                  width: Dimensions.listViewImgSize,
                                  height: Dimensions.listViewImgSize,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Dimensions.radius20,
                                      ),
                                      color: Colors.white38,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              AppConstants.IMG_PATH +
                                                  activityModel.poster!)))),
                              //focus the widget to get all available space
                              Expanded(
                                child: Container(
                                  height: Dimensions.listViewTextContSize,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                            Dimensions.radius20),
                                        bottomRight: Radius.circular(
                                            Dimensions.radius20)),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: Dimensions.height1,
                                      left: Dimensions.widhth10,
                                      right: Dimensions.widhth10,
                                      bottom: Dimensions.height1,
                                    ),
                                    child: AppColumnSmall(
                                        text: activityModel.titleEn!,
                                        stars: activityModel.stars!,
                                        comments_num: activityModel.comments!,
                                        date: activityModel.dates![0].date!,
                                        day: activityModel.dates![0].day!,
                                        time:
                                            activityModel.dates![0].startTime!,
                                        location: activityModel.location!),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                : Column(children: [
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    CircularProgressIndicator(
                      color: AppColors.mainColor1,
                    ),
                  ]);
          }),
        ],
      ),
      bottomNavigationBar: const EntryPoint(),
    );
  }
}
