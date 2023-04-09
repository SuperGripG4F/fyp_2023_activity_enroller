import 'package:shared_preferences/shared_preferences.dart';

class AppConstants {
  // static const String BASE_URL = "http://192.168.50.2:8000";
  static const String BASE_URL = "http://127.0.0.1:8000";
  //static const String BASE_URL = "http://192.168.50.244:8000";
  static const String API_VERSION = "/api/v1";

  //dllm this is for the network img
  static const String IMG_PATH = "$BASE_URL$API_VERSION/upload?img=";

  // following is for the getx api
  static const String LOGIN = "$API_VERSION/auth/";
  static const String TOKEN_LOGIN = "${LOGIN}token";

  //user info
  static const String USER_INFO = "$API_VERSION/user/";

  //activities related
  static const String POPULAR_ACTIVITY_URL = "$API_VERSION/activities/popular";
  static const String RECOMMENDED_ACTIVITY_URL =
      "$API_VERSION/activities/recommended";
  static const String SEARCH_ACTIVITY_URL = "$API_VERSION/activities/search";
  static const String SEARCH_ACTIVITY_DETAIL_URL =
      "$SEARCH_ACTIVITY_URL/detail";
  static const String JOIN_ACTIVITY_URL = "$API_VERSION/activities/join";
  static const String JOINED_ACTIVITY_URL = "$API_VERSION/activities/joined";
  static const String COMMENT_ACTIVITY_URL =
      "$API_VERSION/activities/joined/comment";

  static const String ANNOUNCEMENT_URL =
      "$API_VERSION/activities/announcements";
  static const String APP_NAME = "Activity Helper";
  static const String APP_VERSION = "version:1.0";

  //token
  static const String _tokenKey = "";

  // Store token in shared preferences
  static Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

// Retrieve token from shared preferences
  static Future<String> retrieveToken() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getString(_tokenKey) ?? "");
  }

// Remove token from shared preferences
  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
