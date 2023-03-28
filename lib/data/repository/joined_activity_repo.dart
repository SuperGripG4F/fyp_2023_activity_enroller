import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class JoinedActivityRepo extends GetxService {
  final ApiClient apiClient;

  JoinedActivityRepo({required this.apiClient});

  Future<Response> getJoinedActivityList() async {
    return await apiClient.getData(AppConstants.JOINED_ACTIVITY_URL);
  }

  Future<Response> postComment(String id, String rating, String comment) async {
    return await apiClient.postData(AppConstants.COMMENT_ACTIVITY_URL,
        {"activity_id": id, "rating": rating, "comment": comment});
  }
}
