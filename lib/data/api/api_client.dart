import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  //server url
  final String appBaseUrl;

  //storing data
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    //trying lifetime
    AppConstants.retrieveToken().then((value) {
      print("token is $value");
      token = value;
      timeout = Duration(seconds: 30);
      _mainHeaders = {
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': "Token $token",
      };

      userAgent = 'getx-client';
      timeout = const Duration(seconds: 5);
      followRedirects = true;
      maxRedirects = 5;
      sendUserAgent = false;
      maxAuthRetries = 1;
      allowAutoSignedCert = false;
      withCredentials = false;
    });
  }

  Future<Response> getData(String uri) async {
    //uri only need endpoint
    //make sure the token is retrieved first
    token = await AppConstants.retrieveToken();
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': "Token $token",
    };
    try {
      Response response = await get(uri, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getDataQuery(String uri, Map<String, dynamic>? query) async {
    //uri only need endpoint
    token = await AppConstants.retrieveToken();
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': "Token $token",
    };
    try {
      Response response = await get(uri, headers: _mainHeaders, query: query);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    //make sure the token is retrieved first
    token = await AppConstants.retrieveToken();
    try {
      Response response = await post(
        uri,
        body,
        headers: _mainHeaders,
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

  Future<Response> postLogin(String uri, dynamic body) async {
    try {
      Response response = await post(
        uri,
        body,
        // headers: _mainHeaders,
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
