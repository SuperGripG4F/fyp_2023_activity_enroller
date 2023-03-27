import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/components/side_menu.dart';
import 'package:fyp_2023_activity_enroller/pages/home/activity_page_body.dart';
import 'package:fyp_2023_activity_enroller/widgets/enrty_point.dart';
import 'package:fyp_2023_activity_enroller/utils/app_constants.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/header.dart';
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
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
          HeaderInfo(
            title: AppConstants.APP_NAME,
            subTitle: AppConstants.APP_VERSION,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: const [
                ActivityPageBody(),
              ],
            ),
          )),
        ]),
      ),
      bottomNavigationBar: const EntryPoint(),
    );
  }
}
