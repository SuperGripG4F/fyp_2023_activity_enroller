import 'package:fyp_2023_activity_enroller/pages/activity/popular_activity_detail%20copy.dart';
import 'package:fyp_2023_activity_enroller/pages/activity/recommended_activity_detail.dart';
import 'package:fyp_2023_activity_enroller/pages/home/main_activity_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/home";
  static const String recommendedActivity = "/recommended-activity";
  static const String popularActivity = "/popular-activity";

  static String getInitial() => '$initial';

  static String getPopularActivity(int pageId) =>
      '$popularActivity?pageId=$pageId';

  static String getRecommandedActivity(int pageId) =>
      '$recommendedActivity?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () {
          return MainActivityPage();
        },
        transition: Transition.native),
    GetPage(
        name: popularActivity,
        page: () {
          var pageId = Get.parameters['pageId'];
          print("pageId " + pageId! + " clicked");
          return PopularActivityDetail(
            pageId: int.parse(pageId),
          );
        },
        transition: Transition.rightToLeft),
    GetPage(
        name: recommendedActivity,
        page: () {
          var pageId = Get.parameters['pageId'];
          print("pageId " + pageId! + " clicked");
          return RecommendedActivityDetail(
            pageId: int.parse(pageId),
          );
        },
        transition: Transition.rightToLeft),
  ];
}
