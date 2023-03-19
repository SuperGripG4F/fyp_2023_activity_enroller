import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class JoinedActivityRepo extends GetxService {
  final ApiClient apiClient;

  JoinedActivityRepo({required this.apiClient});

  Future<Response> getPopularActivityList() async {
    return await apiClient.getData(AppConstants.POPULAR_ACTIVITY_URL);
  }
}
