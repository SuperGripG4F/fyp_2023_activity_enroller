import 'package:fyp_2023_activity_enroller/pages/activity/recommended_activity_detail.dart';
import 'package:fyp_2023_activity_enroller/pages/home/main_activity_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/home";
  static const String recommendedActivity = "/recommended-activity";

  static String getInitial() => '$initial';

  static String getRecommendedFood(int pageId) =>
      '$recommendedActivity?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () {
          return MainActivityPage();
        },
        transition: Transition.native),
    GetPage(
        name: recommendedActivity,
        page: () {
          var pageId = Get.parameters['pageId'];
          print("pageId " + pageId! + " clicked");
          return RecommendedActivityDetail(pageId: int.parse(pageId));
        },
        transition: Transition.rightToLeft),
  ];
}
