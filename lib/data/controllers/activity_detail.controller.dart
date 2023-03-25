import 'package:flutter/foundation.dart';
import 'package:fyp_2023_activity_enroller/data/model/activity_model.dart';
import 'package:get/get.dart';

import '../repository/activity_detail.dart';

class ActivityDetailController extends GetxController {
  final ActivityDetailRepo activityDetailRepo;

  ActivityDetailController({required this.activityDetailRepo});

  ActivityModel _activityModel = ActivityModel();
  ActivityModel get activityModel => _activityModel;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getActivityDetail(activityid) async {
    if (kDebugMode) {
      print("getting activity....");
    }
    Response response = await activityDetailRepo.getActivityDetail(activityid);
    if (response.statusCode == 200) {
      print("got activity");
      _activityModel = ActivityModel.fromJson(response.body);
      _isLoaded = true;
      print(_activityModel.poster);
      update();
      return;
    } else {}
  }

  Future<int> joinActivity(activityId) async {
    if (kDebugMode) {
      print("id:$activityId");
    }
    //api body is string {"activityid":"1"}
    Response response =
        await activityDetailRepo.postJoinActivity(activityId.toString());
    if (response.statusCode == 201) {
      if (kDebugMode) {
        print("join activity success");
      }
      return response.statusCode!;
    } else if (response.statusCode == 302) {
      if (kDebugMode) {
        print("already joined activity ");
      }
      return response.statusCode!;
    } else {
      return response.statusCode!;
    }
  }

  @override
  void onClose() {
    // 取消未完成的异步任务或网络请求
    _isLoaded = false;
    super.onClose();
  }
}
