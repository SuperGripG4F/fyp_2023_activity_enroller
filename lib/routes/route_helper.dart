import 'package:fyp_2023_activity_enroller/pages/activity/recommended_activity_detail.dart';
import 'package:fyp_2023_activity_enroller/pages/home/main_activity_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularActivity = "/popular-activity";
  static const String recommendedActivity = "/recommended-activity";

  static String getInitial() => '$initial';
  //static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood() => '$recommendedActivity';

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () {
          return MainActivityPage();
        },
        transition: Transition.leftToRight),
    GetPage(
        name: popularActivity,
        page: () {
          return RecommendedActivityDetail();
        },
        transition: Transition.rightToLeft),
  ];
}
