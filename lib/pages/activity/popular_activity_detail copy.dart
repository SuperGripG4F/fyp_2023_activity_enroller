import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/popular_activity_controller.dart';

import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_column_detail.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';

class PopularActivityDetail extends StatelessWidget {
  int pageId;

  PopularActivityDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var product = Get.find<PopularProductController>().popularProductList[pageId];
    var activityModel =
        Get.find<PopularActivityController>().popularActivityList[pageId];
    //print("in popular page" + activityModel.titleEn);
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
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20))),
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
                    return DetailScreen();
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
                  child: Icon(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          color: AppColors.mainColor1,
          child: Center(
            child: Image.asset(
              'assets/image/act1.png',
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
