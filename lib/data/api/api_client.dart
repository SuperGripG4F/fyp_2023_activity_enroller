import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  //server url
  final String appBaseUrl;

  final _connect = GetConnect();

  //storing data
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    //trying lifetime
    token = AppConstants.TOKEN;
    timeout = Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      //Bearer is used for Authorization
      'Authorization': 'Bearer $token',
    };

    // userAgent = 'getx-client';
    // timeout = const Duration(seconds: 5);
    // followRedirects = true;
    // maxRedirects = 5;
    // sendUserAgent = false;
    // maxAuthRetries = 1;
    // allowAutoSignedCert = false;
    // withCredentials = false;
  }

  Future<Response> getData(String uri) async {
    //uri only need endpoint
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response = await post(
        uri,
        body,
      );
      if (kDebugMode) {
        print("responseBygetx: " + response.statusCode.toString());
      }
      return response;
      ;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
