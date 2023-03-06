import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/pages/home/activity_page_body.dart';
import 'package:fyp_2023_activity_enroller/pages/home/enrty_point.dart';
import 'package:fyp_2023_activity_enroller/utils/app_constants.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class MainActivityPage extends StatelessWidget {
  const MainActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("current height is " + MediaQuery.of(context).size.height.toString());
    print("current width is " + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: AppConstants.APP_NAME,
                        color: AppColors.mainColor1,
                      ),
                      Row(
                        children: [
                          const SmallText(
                            text: AppConstants.APP_VERSION,
                            color: Colors.black54,
                          ),
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.widhth45,
                      height: Dimensions.height45,
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: Dimensions.size24,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.mainColor1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //showing the body
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                ActivityPageBody(),
              ],
            ),
          )),
        ],
      ),
      bottomNavigationBar: EntryPoint(),
    );
  }
}
