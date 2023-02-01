import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_column_detail.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';

class RecommendedActivityDetail extends StatelessWidget {
  const RecommendedActivityDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.clear)),
                //AppIcon(icon: Icons.shopping_bag_outlined)
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20))),
                  // child: Center(
                  //     child: BigText(
                  //   size: Dimensions.font26,
                  //   text: "招募音樂人/Band 隊!!!",
                  // )),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
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
                child: Image.asset(
                  "assets/image/act1.png",
                  width: double.maxFinite,
                  fit: BoxFit.fitWidth,
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
                  text: '攝影比賽',
                  stars: 5,
                  comments_num: 1200,
                  date: "5-2-2023",
                  day: "Mon",
                  time: "14:00",
                  location: "循道衛理中心愛秩序灣",
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
