import 'package:flutter/material.dart';
import 'package:blueconnectapp/core/constants/route_paths.dart';
// Set up router for the project

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/' :
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