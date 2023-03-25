import 'package:flutter/foundation.dart';
import 'package:fyp_2023_activity_enroller/components/side_menu.dart';
import 'package:fyp_2023_activity_enroller/pages/activity/popular_activity_detail.dart';
import 'package:fyp_2023_activity_enroller/pages/activity/recommended_activity_detail.dart';
import 'package:fyp_2023_activity_enroller/pages/announcement/announcements_page.dart';
import 'package:fyp_2023_activity_enroller/pages/home/main_activity_page.dart';
import 'package:fyp_2023_activity_enroller/pages/login/login_page.dart';
import 'package:fyp_2023_activity_enroller/pages/login/welcome_page.dart';
import 'package:get/get.dart';

import '../data/model/activity_model.dart';
import '../pages/activity/activity_detail.dart';
import '../pages/activity/popular_activity_detail.dart';
import '../pages/announcement/announcements_detail.dart';
import '../pages/user/user_page.dart';
import '../widgets/enrty_point.dart';
import '../pages/search/search_page.dart';

class RouteHelper {
  static const String welcome = "/welcome";
  static const String login = "/login";
  static const String initial = "/home";
  //to detail page
  static const String recommendedActivity = "/recommended-activity";
  static const String popularActivity = "/popular-activity";

  //this is home page not detail page
  static const String searchActivity = "/search-activity";
  static const String searchActivityDetail = "/search-activity-detail";

  static const String announcement = "/announcement";
  static const String announcementDetail = "/announcement-detail";
  static const String userProfile = "/user-profile";

  static String getWelcome() => '$welcome';

  static String getLogin() => '$login';

  static String getInitial() => '$initial';

  static String getPopularActivity(int pageId) =>
      '$popularActivity?pageId=$pageId';

  static String getRecommandedActivity(int pageId) =>
      '$recommendedActivity?pageId=$pageId';

  static String getSearchActivityDetail(int activityId) =>
      '$searchActivityDetail?activityId=$activityId';

  static String getSearchActivity() => '$searchActivity';

  static String getAnnouncement() => '$announcement';

  static String getAnnouncementDetail(int activityId) =>
      '$announcementDetail?activityId=$activityId';

  static String getUserProfile() => '$userProfile';

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
        },
        transition: Transition.cupertinoDialog,
        fullscreenDialog: true),
    GetPage(
        name: popularActivity,
        page: () {
          var pageId = Get.parameters['pageId'];
          if (kDebugMode) {
            print("pageId ${pageId!} clicked");
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
            print("pageId ${pageId!} clicked");
          }
          return RecommendedActivityDetail(
            pageId: int.parse(pageId!),
          );
        },
        transition: Transition.rightToLeft),
    GetPage(
      name: searchActivity,
      page: () {
        return const SearchPage();
      },
      fullscreenDialog: true,
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: searchActivityDetail,
      page: () {
        final activityId = Get.parameters['activityId'];
        print("activityId: $activityId");
        return ActivityDetail(activityId: activityId!);
      },
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: announcement,
      page: () {
        return const AnnouncementsPage();
      },
      fullscreenDialog: true,
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: announcementDetail,
      page: () {
        var activityId = Get.parameters['activityId'];
        return AnnouncementsDetailPage(
          activityId: int.parse(activityId!),
        );
      },
      fullscreenDialog: true,
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: userProfile,
      page: () {
        return const UserPage();
      },
      fullscreenDialog: true,
      transition: Transition.cupertinoDialog,
    ),
  ];
}
