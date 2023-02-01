import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class ActivityDetail extends StatelessWidget {
  int pageId;
  ActivityDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var product = Get.find<PopularProductController>().popularProductList[pageId];
    //print("page is id " + pageId.toString());
    //print("product name is " + product.name.toString());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background img
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/act1.png"),
                  //image: NetworkImage(product.img),
                )),
              )),
          //icon widgets
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.widhth20,
              right: Dimensions.widhth20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        //Get.toNamed(RouteHelper.initial);
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
          //introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - Dimensions.height20,
            child: Container(
                padding: EdgeInsets.only(
                  left: Dimensions.widhth20,
                  right: Dimensions.widhth20,
                  top: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      //ext: product.name,
                      text: '招募音樂人/Band 隊!!!',
                      stars: 5,
                      comments_num: 1200,
                      date: "5-2-2023",
                      day: "Mon",
                      time: "14:00",
                      location: "循道衛理中心愛秩序灣",
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                          //text: product.description
                          text: "Re-Union Band Show 招募音樂人/Band 隊!!!" +
                              "\n各位音樂人Band友!! 三年時間無同大家相聚!!" +
                              "\n黎緊5/2/2023 將會有2023年首個 Band Show! 大家一齊黎聚一聚! " +
                              "\n日期: 5/2/2023(星期日)" +
                              "\n採排時間: 早上10:00-12:00 (報名後通知)" +
                              "\n表演時間: 下午2:00-5:00" +
                              "\n表演隊伍: 8隊!" +
                              "\n每個表演單位 2-3首歌!" +
                              "\n截止報名日期: 30/1/2023!" +
                              "\n名額有限, 先到先得!",
                        ),
                      ),
                    )
                  ],
                )),
          )
          //expandable text
        ],
      ),
      bottomNavigationBar: Container(
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
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.widhth20,
                  right: Dimensions.widhth20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.widhth10,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimensions.widhth10,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
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
                text: "\$10 | Add to cart",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
