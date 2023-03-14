import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';

import '../../data/controllers/recommended_activity_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_column_detail.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';

class RecommendedActivityDetail extends StatelessWidget {
  int pageId;

  RecommendedActivityDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var activityModel = Get.find<RecommondedActivityController>()
        .recommendedActivityList[pageId];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            collapsedHeight: 100,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: AppIcon(icon: Icons.clear)),
              ],
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20))),
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Center(
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 10, right: 30, left: 30),
                      width: 60,
                      height: 5,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor1,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                )),
            expandedHeight: 300,
            backgroundColor: AppColors.mainColor1,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(activityModel: activityModel);
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        AppConstants.IMG_PATH + activityModel.poster!),
                  )),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    right: Dimensions.widhth20, left: Dimensions.widhth20),
                child: AppColumnDetail(
                  text: activityModel.titleEn,
                  stars: activityModel.stars,
                  comments_num: activityModel.comments,
                  date: activityModel.dates[0].date,
                  day: activityModel.dates[0].day,
                  time: activityModel.dates[0].startTime,
                  location: activityModel.location,
                ),
              ),
            ],
          ))
        ],
      ),
      bottomNavigationBar: Container(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            height: Dimensions.height120,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.widhth20,
                right: Dimensions.widhth20),
            decoration: BoxDecoration(
                color: AppColors.buttionbackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Dimensions.radius20 * 2,
                    ),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //love icon
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.widhth20,
                      right: Dimensions.widhth20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: const Icon(
                    Icons.favorite,
                    color: AppColors.mainColor1,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.widhth20,
                      right: Dimensions.widhth20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor1),
                  child: BigText(
                    text: "Join Now",
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  var activityModel;

  DetailScreen({Key? key, required this.activityModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          color: AppColors.mainColor1,
          child: Center(
            child: Image(
                image: NetworkImage(
                    AppConstants.IMG_PATH + activityModel.poster!)),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
