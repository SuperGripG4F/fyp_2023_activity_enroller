import 'package:flutter/foundation.dart';
import 'package:fyp_2023_activity_enroller/components/side_menu.dart';
import 'package:fyp_2023_activity_enroller/pages/announcement/announcements_page.dart';
import 'package:fyp_2023_activity_enroller/pages/history/history_page.dart';
import 'package:fyp_2023_activity_enroller/pages/home/main_activity_page.dart';
import 'package:fyp_2023_activity_enroller/pages/login/login_page.dart';
import 'package:fyp_2023_activity_enroller/pages/login/welcome_page.dart';
import 'package:get/get.dart';

import '../data/model/activity_model.dart';
import '../pages/activity/activity_detail.dart';
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
  static const String searchActivity = "/search-activity";
  static const String activityDetail = "/activity-detail";

  static const String history = "/history";
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

  static String getActivityDetail(int activityId) =>
      '$activityDetail?activityId=$activityId';

  static String getSearchActivity() => '$searchActivity';

  static String getHistory() => '$history';

  static String getAnnouncement() => '$announcement';

  static String getAnnouncementDetail(int index) =>
      '$announcementDetail?index=$index';

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
      name: searchActivity,
      page: () {
        return const SearchPage();
      },
      fullscreenDialog: true,
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: activityDetail,
      page: () {
        final activityId = Get.parameters['activityId'];
        print("activityId: $activityId");
        return ActivityDetail(activityId: activityId!);
      },
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: history,
      page: () {
        return const HistoryPage();
      },
      fullscreenDialog: true,
      transition: Transition.cupertinoDialog,
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
        var index = Get.parameters['index'];
        return AnnouncementsDetailPage(
          index: int.parse(index!),
        );
      },
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
