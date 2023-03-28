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

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  @override
  void initState() {
    Get.lazyPut(() => JoinedActivityController(joinedActivityRepo: Get.find()));
    Get.find<JoinedActivityController>().getJoinedActivityList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
        HeaderInfo(
          title: "History",
          subTitle: "Yours activities",
        ),
        Expanded(child: GetBuilder<JoinedActivityController>(
          builder: (joinedActivity) {
            return joinedActivity.isLoaded
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: joinedActivity.joinedActivityList.length,
                    itemBuilder: (BuildContext context, int index) {
                      ActivityModel activityModel =
                          joinedActivity.joinedActivityList[index]!;
                      return GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getHistoryActivity(index));
                          },
                          child: SmallAppColumn(activityModel: activityModel));
                    },
                  )
                : CircularProgress();
          },
        )),
      ])),
      bottomNavigationBar: const EntryPoint(),
    );
  }
}

class SmallAppColumn extends StatelessWidget {
  final ActivityModel activityModel;
  const SmallAppColumn({super.key, required this.activityModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      // width: MediaQuery.of(context).size.width * 0.9,
      child: SizedBox(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            //image
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF69c5df),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    // image: AssetImage("assets/image/act1.png"),
                    image: NetworkImage(
                        AppConstants.IMG_PATH + activityModel.poster!),
                  )),
            ),
            //info
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                    ),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ],
                  border: Border.all(
                    color: Color.fromARGB(255, 200, 200, 200),
                    width: 1.0,
                  )),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  left: Dimensions.widhth10,
                  right: Dimensions.widhth10,
                  // bottom: Dimensions.height10
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: activityModel.titleEn ?? "Title error",
                      size: Dimensions.font16,
                    ),
                    SmallText(text: activityModel.dates![0].date!)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
