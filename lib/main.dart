import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/components/side_menu.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/popular_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/recommended_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/search_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/pages/activity/activity_detail.dart';
import 'package:fyp_2023_activity_enroller/pages/activity/recommended_activity_detail.dart';
import 'package:fyp_2023_activity_enroller/pages/home/main_activity_page.dart';
import 'package:fyp_2023_activity_enroller/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'data/controllers/joined_activity_controller.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //for test !!!!
    //Get.find<PopularActivityController>().getPopularActivityList();
    // Get.find<RecommondedActivityController>().getRecommendedActivityList();
    // Get.find<SeacrhActivityController>().getActivityList();
    // Get.find<JoinedActivityController>().getJoinedActivityList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      popGesture: false,
      //home: RouteHelper.getInitial), // it will go to '/'
      initialRoute: RouteHelper.getLogin(),
      getPages: RouteHelper.routes,
    );
  }
}
