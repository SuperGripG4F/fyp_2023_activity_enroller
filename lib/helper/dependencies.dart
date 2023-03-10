import 'package:fyp_2023_activity_enroller/data/controllers/popular_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/recommended_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/search_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/data/repository/popular_activity_repo.dart';
import 'package:fyp_2023_activity_enroller/data/repository/recommend_activity_repo.dart';
import 'package:fyp_2023_activity_enroller/data/repository/search_activity_repo.dart';
import 'package:get/get.dart';

import '../data/api/api_client.dart';
import '../utils/app_constants.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularActivityRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedActivityRepo(apiClient: Get.find()));
  Get.lazyPut(() => SearchActivityRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularActivityController(popularActivityRepo: Get.find()));
  Get.lazyPut(
      () => RecommondedActivityController(recommendedActivityRepo: Get.find()));
  Get.lazyPut(() => SeacrhActivityController(searchActivityRepo: Get.find()));
}
