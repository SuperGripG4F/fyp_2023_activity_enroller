import 'package:fyp_2023_activity_enroller/data/model/activity_model.dart';
import 'package:fyp_2023_activity_enroller/data/repository/popular_activity_repo.dart';
import 'package:fyp_2023_activity_enroller/data/repository/recommend_product_repo.dart';
import 'package:get/get.dart';

class RecommondedActivityController extends GetxController {
  final RecommendedActivityRepo recommendedActivityRepo;

  RecommondedActivityController({required this.recommendedActivityRepo});

  List<dynamic> _recommendedActivityList = [];
  List<dynamic> get recommendedActivityList => _recommendedActivityList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedActivityList() async {
    //put a await untill we get the data
    //json response
    //everthing save here
    Response response =
        await recommendedActivityRepo.getRecommendedActivityList();
    if (response.statusCode == 200) {
      print("got recommended");
      _recommendedActivityList = [];
      _recommendedActivityList
          .addAll(Activity.fromJson(response.body).activities);
      print(_recommendedActivityList[0].titleEn);
      _isLoaded = true;
      update();
    } else {
      //failed return
    }
  }
}
