import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class ActivityDetailRepo extends GetxService {
  final ApiClient apiClient;

  ActivityDetailRepo({required this.apiClient});

  Future<Response> getActivityDetail(activityid) async {
    return await apiClient.getDataQuery(
        AppConstants.SEARCH_ACTIVITY_DETAIL_URL, {"activityid": activityid});
  }

  Future<Response> postJoinActivity(activityid) async {
    //activityid lower caps it's correct
    return await apiClient
        .postData(AppConstants.JOIN_ACTIVITY_URL, {"activityid": activityid});
  }
}
