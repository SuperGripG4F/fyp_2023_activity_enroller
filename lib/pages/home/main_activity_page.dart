import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/components/side_menu.dart';
import 'package:fyp_2023_activity_enroller/pages/home/activity_page_body.dart';
import 'package:fyp_2023_activity_enroller/pages/home/enrty_point.dart';
import 'package:fyp_2023_activity_enroller/utils/app_constants.dart';
import 'package:rive/rive.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class MainActivityPage extends StatefulWidget {
  MainActivityPage({super.key});

  @override
  State<MainActivityPage> createState() => _MainActivityPageState();
}

class _MainActivityPageState extends State<MainActivityPage>
    with SingleTickerProviderStateMixin {
  bool isSideBarClosed = true;
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("current height is " + MediaQuery.of(context).size.height.toString());
    print("current width is " + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        //sideMenu
        Transform.translate(
          offset: Offset(animation.value * 288, 0),
          child: Column(
            children: [
              //showing the header
              Container(
                child: Container(
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
                              children: [
                                const SmallText(
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
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn,
          width: 288,
          left: isSideBarClosed ? -288 : 0,
          height: MediaQuery.of(context).size.height,
          child: SideMenu(),
        ),
        //btn
        AnimatedPositioned(
          duration: Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn,
          top: isSideBarClosed ? -10 : 16,
          left: isSideBarClosed ? 300 : 200,
          child: SafeArea(
            //alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                print("Side taped");
                setState(() {
                  if (isSideBarClosed) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                  isSideBarClosed = !isSideBarClosed;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: Dimensions.widhth45,
                height: Dimensions.height45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: isSideBarClosed
                        ? AppColors.mainColor1
                        : AppColors.mainColor2),
                child: isSideBarClosed
                    ? Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: Dimensions.size24,
                      )
                    : Icon(
                        Icons.close,
                        color: Colors.white,
                        size: Dimensions.size24,
                      ),
              ),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: const EntryPoint(),
    );
  }
}
