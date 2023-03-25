import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class PopularActivityRepo extends GetxService {
  final ApiClient apiClient;

  PopularActivityRepo({required this.apiClient});

  Future<Response> getPopularActivityList() async {
    return await apiClient.getData(AppConstants.POPULAR_ACTIVITY_URL);
  }

  Future<Response> postJoinActivity(activityid) async {
    //activityid lower caps it's correct
    return await apiClient
        .postData(AppConstants.JOIN_ACTIVITY_URL, {"activityid": activityid});
  }
}
