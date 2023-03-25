import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class LoginController extends GetxController {
  final ApiClient apiClient;

  final username = ''.obs;
  final password = ''.obs;
  final errorMessage = ''.obs;

  LoginController({required this.apiClient});

  Future<bool> login() async {
    print("login path:" + AppConstants.LOGIN);
    final response = await apiClient.postData(AppConstants.LOGIN,
        {'username': username.value, 'password': password.value});
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("login success");
        Map<String, dynamic> user = response.body;
        print(user['token']);
        AppConstants.storeToken(user['token']);
      }
      return true;
    } else {
      //failed return
      return false;
    }
  }

  Future<bool> tokenLogin() async {
    // print("token login path:" + AppConstants.TOKEN_LOGIN);
    final token = await AppConstants.retrieveToken();

    final response = await apiClient.getData(AppConstants.TOKEN_LOGIN);
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("login success");
      }
      return true;
    } else {
      //failed return
      if (kDebugMode) {
        print("login fail: ${response.statusCode}");
      }
      return false;
    }
  }
}
