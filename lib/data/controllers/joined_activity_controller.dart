import 'package:flutter/foundation.dart';
import 'package:fyp_2023_activity_enroller/data/model/activity_model.dart';
import 'package:fyp_2023_activity_enroller/data/repository/joined_activity_repo.dart';

import 'package:get/get.dart';

class JoinedActivityController extends GetxController {
  final JoinedActivityRepo joinedActivityRepo;

  JoinedActivityController({required this.joinedActivityRepo});

  List<dynamic> _joinedActivityList = [];
  List<dynamic> get joinedActivityList => _joinedActivityList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getJoinedActivityList() async {
    //put a await untill we get the data
    //json response
    //everthing save here
    Response response = await joinedActivityRepo.getJoinedActivityList();
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("got joined Activities");
      }
      _joinedActivityList = [];
      _joinedActivityList.addAll(Activity.fromJson(response.body).activities);
      //print(_joinedActivityList[0].desc);
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
