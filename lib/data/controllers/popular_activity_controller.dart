import 'package:flutter/foundation.dart';
import 'package:fyp_2023_activity_enroller/data/api/api_client.dart';
import 'package:fyp_2023_activity_enroller/data/model/activity_model.dart';
import 'package:fyp_2023_activity_enroller/data/repository/popular_activity_repo.dart';
import 'package:get/get.dart';

class PopularActivityController extends GetxController {
  final PopularActivityRepo popularActivityRepo;

  PopularActivityController({required this.popularActivityRepo});
  List<dynamic> _popularActivityList = [];
  List<dynamic> get popularActivityList => _popularActivityList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularActivityList() async {
    bool retry = true;

    Response response = await popularActivityRepo.getPopularActivityList();
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("got popular activity list");
      }
      _popularActivityList = [];
      _popularActivityList.addAll(Activity.fromJson(response.body).activities);
      print(_popularActivityList[0].titleEn);
      _isLoaded = true;
      update();
    } else {
      //failed return
      print(
          "fail to got popular activity list${response.statusCode} : ${response.body}");
    }
  }

  Future<int> joinActivity(activityId) async {
    print("id:" + activityId.toString());
    //api body is string {"activityid":"1"}
    Response response =
        await popularActivityRepo.postJoinActivity(activityId.toString());
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
