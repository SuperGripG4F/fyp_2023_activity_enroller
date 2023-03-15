import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';
import '../repository/popular_activity_repo.dart';

class LoginController extends GetxController {
  final ApiClient apiClient;
  //final PopularActivityRepo popularActivityRepo;

  final email = ''.obs;
  final password = ''.obs;
  final errorMessage = ''.obs;

  LoginController({required this.apiClient});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> login() async {
    // Response response = await apiClient.postData(
    //     AppConstants.LOGIN, {'email': email.value, 'password': password.value});

    final response = await apiClient.postData(
        AppConstants.LOGIN, {'email': email.value, 'password': password.value});
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("login success");
      }
      // todo

      _isLoaded = true;
      update();
    } else {
      //failed return
    }
  }
}
