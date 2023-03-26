import 'package:flutter/foundation.dart';
import 'package:fyp_2023_activity_enroller/data/model/announcements.dart';

import 'package:get/get.dart';

import '../repository/activity_announcement_repo.dart';

class ActivityAnnouncementController extends GetxController {
  final ActivityAnnouncementRepo activityAnnouncementRepo;

  ActivityAnnouncementController({required this.activityAnnouncementRepo});

  List<dynamic> _announcementList = [];
  List<dynamic> get announcementList => _announcementList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getAnnouncementList() async {
    //put a await untill we get the data
    //json response
    //everthing save here
    Response response =
        await activityAnnouncementRepo.getActivityAnnouncements();

    if (response.statusCode == 200) {
      _announcementList = [];
      _announcementList
          .addAll(Announcements.fromJson(response.body).announcements);

      if (kDebugMode) {
        print("got activity announcements");
        print(_announcementList[0].content);
      }

      _isLoaded = true;
      update();
    } else {
      //failed return
      if (kDebugMode) {
        print("response.statusCode == ${response.statusCode}");
      }
    }
  }

  @override
  void onClose() {
    // 取消未完成的异步任务或网络请求
    _isLoaded = false;
    super.onClose();
  }
}
