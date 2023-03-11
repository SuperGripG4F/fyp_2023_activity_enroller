import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteObserver extends GetObserver {
  @override
  void onClose(Route route) {
    print('Route ${route.settings.name} has been closed');
  }
}
