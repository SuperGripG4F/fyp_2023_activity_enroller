import 'package:flutter/foundation.dart';
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
    //put a await untill we get the data
    //json response
    //everthing save here
    Response response = await popularActivityRepo.getPopularActivityList();
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("got activity");
      }
      _popularActivityList = [];
      _popularActivityList.addAll(Activity.fromJson(response.body).activities);
      //print(_popularActivityList[0].titleEn);
      _isLoaded = true;
      update();
    } else {
      //failed return
    }
  }

  @override
  void onClose() {
    // 取消未完成的异步任务或网络请求
    _isLoaded = false;
    super.onClose();
  }
}
