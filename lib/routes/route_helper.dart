import 'package:flutter/foundation.dart';
import 'package:fyp_2023_activity_enroller/components/side_menu.dart';
import 'package:fyp_2023_activity_enroller/pages/activity/popular_activity_detail.dart';
import 'package:fyp_2023_activity_enroller/pages/activity/recommended_activity_detail.dart';
import 'package:fyp_2023_activity_enroller/pages/home/main_activity_page.dart';
import 'package:fyp_2023_activity_enroller/pages/login/login_page.dart';
import 'package:fyp_2023_activity_enroller/pages/login/welcome_page.dart';
import 'package:get/get.dart';

import '../pages/activity/popular_activity_detail.dart';
import '../pages/home/enrty_point.dart';
import '../pages/search/search_page.dart';

class RouteHelper {
  static const String welcome = "/welcome";
  static const String login = "/login";
  static const String initial = "/home";
  static const String recommendedActivity = "/recommended-activity";
  static const String popularActivity = "/popular-activity";
  static const String searchActivity = "/search-activity";
  // static const String imgDetail = "/img-detail";

  static String getWelcome() => '$welcome';

  static String getLogin() => '$login';

  static String getInitial() => '$initial';

  static String getPopularActivity(int pageId) =>
      '$popularActivity?pageId=$pageId';

  static String getRecommandedActivity(int pageId) =>
      '$recommendedActivity?pageId=$pageId';

  static String getSearchActivity() => '$searchActivity';

  // static String getimgDetail(int pageId) => '$imgDetail?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(
        name: welcome,
        page: () {
          return const WelcomePage();
        },
        transition: Transition.cupertinoDialog,
        fullscreenDialog: true),
    GetPage(
        name: login,
        page: () {
          return LoginPage();
        },
        transition: Transition.cupertinoDialog,
        fullscreenDialog: true),
    GetPage(
        name: initial,
        page: () {
          return MainActivityPage();
          //return const WelcomePage();
        },
        transition: Transition.cupertinoDialog,
        fullscreenDialog: true),
    GetPage(
        name: popularActivity,
        page: () {
          var pageId = Get.parameters['pageId'];
          if (kDebugMode) {
            print("pageId " + pageId! + " clicked");
          }
          return PopularActivityDetail(
            pageId: int.parse(pageId!),
          );
        },
        transition: Transition.rightToLeft),
    GetPage(
        name: recommendedActivity,
        page: () {
          var pageId = Get.parameters['pageId'];
          if (kDebugMode) {
            print("pageId " + pageId! + " clicked");
          }
          return RecommendedActivityDetail(
            pageId: int.parse(pageId!),
          );
        },
        transition: Transition.rightToLeft),
    GetPage(
      name: searchActivity,
      page: () {
        return SearchPage();
      },
      fullscreenDialog: true,
      transition: Transition.cupertinoDialog,
    ),
  ];
}
