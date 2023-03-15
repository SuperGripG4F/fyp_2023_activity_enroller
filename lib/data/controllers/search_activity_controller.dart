import 'package:flutter/foundation.dart';
import 'package:fyp_2023_activity_enroller/data/model/activity_model.dart';
import 'package:fyp_2023_activity_enroller/data/repository/search_activity_repo.dart';
import 'package:get/get.dart';

class SeacrhActivityController extends GetxController {
  final SearchActivityRepo searchActivityRepo;

  SeacrhActivityController({required this.searchActivityRepo});

  List<dynamic> _ActivityList = [];
  List<dynamic> get ActivityList => _ActivityList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getActivityList() async {
    if (kDebugMode) {
      print("getting activity....");
    }
    Response response = await searchActivityRepo.getActivityList();
    if (response.statusCode == 200) {
      print("got all activity");
      _ActivityList = [];
      _ActivityList.addAll(Activity.fromJson(response.body).activities);
      //print(_ActivityList[0].desc);
      _isLoaded = true;
      update();
    } else {}
  }

  @override
  void onClose() {
    // 取消未完成的异步任务或网络请求
    _isLoaded = false;
    super.onClose();
  }
}
