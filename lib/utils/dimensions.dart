import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static double pageView = screenHeight / 2.64;

  static double height5 = screenHeight / 168.8;
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.1;
  static double height45 = screenHeight / 18.7;
  static double height120 = screenHeight / 7.03;

  static double widhth10 = screenWidth / 39;
  static double widhth20 = screenWidth / 19.5;
  static double widhth30 = screenWidth / 13;
  static double widhth45 = screenWidth / 8.6;
  //iPhone height 844 / 320 container height = 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 5.62;

  //font size
  static double font20 = screenHeight / 42.2;
  static double font12 = screenHeight / 70.3;
  static double font26 = screenHeight / 32.46;
  static double font16 = screenHeight / 52.75;

  //Icon Size
  static double size24 = screenHeight / 35.17;
  static double size16 = screenHeight / 52.75;
  //radius
  static double radius20 = 20;

  //list view size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  //popular food
  static double popularFoodImgSize = screenHeight / 2.41;
}
