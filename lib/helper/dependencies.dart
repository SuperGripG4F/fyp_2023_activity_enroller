import 'package:fyp_2023_activity_enroller/data/controllers/joined_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/popular_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/recommended_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/user_info_controller.dart';
import 'package:fyp_2023_activity_enroller/data/repository/activity_announcement_repo.dart';
import 'package:fyp_2023_activity_enroller/data/repository/joined_activity_repo.dart';
import 'package:fyp_2023_activity_enroller/data/repository/popular_activity_repo.dart';
import 'package:fyp_2023_activity_enroller/data/repository/recommend_activity_repo.dart';
import 'package:fyp_2023_activity_enroller/data/repository/search_activity_repo.dart';
import 'package:fyp_2023_activity_enroller/routes/route_observer.dart';
import 'package:get/get.dart';

import '../data/api/api_client.dart';
import '../data/controllers/login_controller.dart';
import '../data/repository/activity_detail_repo.dart';
import '../routes/bottomNav_helper.dart';
import '../utils/app_constants.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularActivityRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedActivityRepo(apiClient: Get.find()));
  Get.lazyPut(() => SearchActivityRepo(apiClient: Get.find()));
  Get.lazyPut(() => JoinedActivityRepo(apiClient: Get.find()));
  Get.lazyPut(() => ActivityDetailRepo(apiClient: Get.find()));
  Get.lazyPut(() => ActivityAnnouncementRepo(apiClient: Get.find()));

  //controllers
  // Get.lazyPut(() => PopularActivityController(popularActivityRepo: Get.find()));
  // Get.lazyPut(
  //     () => RecommondedActivityController(recommendedActivityRepo: Get.find()));
  // Get.lazyPut(() => SeacrhActivityController(searchActivityRepo: Get.find()));
  // Get.lazyPut(() => JoinedActivityController(joinedActivityRepo: Get.find()));
  // Get.lazyPut(() => ActivityDetailController(activityDetailRepo: Get.find()));

  //login controllers
  // Get.lazyPut(() => LoginController(apiClient: Get.find()));
  //userinfo controllers
  // Get.lazyPut(() => UserInfoController(apiClient: Get.find()));

  Get.put(BottomNavHelper());
  Get.put(RouteObserver());
}
