import 'package:basex/app/modules/cart/views/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static AppPages? _instance;
  factory AppPages() {
    if (_instance == null) {
      _instance = AppPages._();
    }
    return _instance!;
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HOME:
        return GetPageRoute(routeName: Routes.HOME, page: () => HomeView());
        case Routes.CART:
        return GetPageRoute(routeName: Routes.CART, page: () => CartView());
    }
    return null;
  }
}
