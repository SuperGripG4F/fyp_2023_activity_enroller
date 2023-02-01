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
    token = AppConstants.TOKEN;
    timeout = Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      //Bearer is used for Authorization
      'Authorization': 'Bearer $token',
    };
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
}
