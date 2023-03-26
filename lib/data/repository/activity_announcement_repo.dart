import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class ActivityAnnouncementRepo extends GetxService {
  final ApiClient apiClient;

  ActivityAnnouncementRepo({required this.apiClient});

  Future<Response> getActivityAnnouncements() async {
    return await apiClient.getData(AppConstants.ANNOUNCEMENT_URL);
  }
}
