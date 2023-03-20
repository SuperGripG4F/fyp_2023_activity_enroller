class AppConstants {
  static const String BASE_URL = "http://192.168.50.5:1880";
  //dllm this is for the network img
  static const String IMG_PATH = BASE_URL + "/upload?img=";
// following is for the getx api
  static const String LOGIN = "/api/v1/auth";
  static const String POPULAR_ACTIVITY_URL = "/api/v1/activities/popular";
  static const String RECOMMENDED_ACTIVITY_URL =
      "/api/v1/activities/recommended";
  static const String SEARCH_ACTIVITY_URL = "/api/v1/activities/search";
  static const String JOINED_ACTIVITY_URL = "/api/v1/activities/joined";
  static const String ANNOUNCEMENT_URL = "/api/v1/activities/announcements";

  static String TOKEN = "";
  static const String APP_NAME = "Activity Helper";
  static const String APP_VERSION = "version:1.0";
}
