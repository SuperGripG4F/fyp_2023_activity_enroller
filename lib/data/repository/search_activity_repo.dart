import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class SearchActivityRepo extends GetxService {
  final ApiClient apiClient;

  SearchActivityRepo({required this.apiClient});

  Future<Response> getActivityList() async {
    return await apiClient.getData(AppConstants.SEARCH_ACTIVITY_URL);
  }
}
