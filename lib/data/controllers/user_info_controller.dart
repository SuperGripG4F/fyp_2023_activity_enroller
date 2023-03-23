import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';
import '../model/user_model.dart';

class UserInfoController extends GetxController {
  final ApiClient apiClient;

  UserInfoController({required this.apiClient});

  // User _userInfo = User(
  //     username: "Temp",
  //     email: "email",
  //     firstname: "firstname",
  //     lastname: "lastname",
  //     phone: "phone",
  //     desc: "desc");

  // User get userInfo => _userInfo;

  Map<String, dynamic> _userInfo = {};
  Map<String, dynamic> get userInfo => _userInfo;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<bool> getUserInfo() async {
    final token = await AppConstants.retrieveToken();
    if (kDebugMode) {
      print("getUserInfo path:" + "${AppConstants.USER_INFO}$token");
    }
    final response = await apiClient.getData("${AppConstants.USER_INFO}$token");
    if (response.statusCode == 200) {
      _userInfo = response.body;
      //_userInfo = User.fromJson(response.body);
      if (kDebugMode) {
        print("getUserInfo success");
        //
        print(_userInfo['username']);
      }
      _isLoaded = true;
      update();
      return true;
    } else {
      //failed return
      return false;
    }
  }
}
