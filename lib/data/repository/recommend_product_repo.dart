import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class RecommendedActivityRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedActivityRepo({required this.apiClient});

  Future<Response> getRecommendedActivityList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_ACTIVITY_URL);
  }
}
