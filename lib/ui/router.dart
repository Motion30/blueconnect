import 'package:flutter/material.dart';
import 'package:blueconnectapp/core/constants/route_paths.dart';
// Set up router for the project

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.INDEX_SCREEN :
        return MaterialPageRoute(builder: (_) => null);

      case Routes.START_UP_SCREEN:
        return MaterialPageRoute(builder: (_) => null);

      case Routes.LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => null);

      case Routes.REGISTER_SCREEN:
        return MaterialPageRoute(builder: (_) => null);

      case Routes.FORGOT_PASSWORD_SCREEN:
        return MaterialPageRoute(builder: (_) => null);

      case Routes.VERIFICATION_SCREEN:
        return MaterialPageRoute(builder: (_) => null);

      case Routes.HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => null);

      case Routes.CREATE_SCREEN:
        return MaterialPageRoute(builder: (_) => null);

      case Routes.ADD_GROUP_SCREEN:
        return MaterialPageRoute(builder: (_) => null);

      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: Text("No route defined for ${settings.name}"),
          ),
        ));
    }
  }
}