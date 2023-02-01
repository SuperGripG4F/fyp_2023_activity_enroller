import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/pages/activity/activity_detail.dart';
import 'package:fyp_2023_activity_enroller/pages/home/main_activity_page.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MainActivityPage(),
      home: ActivityDetail(
        pageId: 0,
      ),
    );
  }
}
