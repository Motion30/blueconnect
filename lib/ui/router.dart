import 'package:blueconnectapp/ui/views/create_screen.dart';
import 'package:blueconnectapp/ui/views/forgotpassword_screen.dart';
import 'package:blueconnectapp/ui/views/gettingstarted_screen.dart';
import 'package:blueconnectapp/ui/views/home_screen.dart';
import 'package:blueconnectapp/ui/views/login_screen.dart';
import 'package:blueconnectapp/ui/views/signup_screen.dart';
import 'package:blueconnectapp/ui/views/startup_screen.dart';
import 'package:blueconnectapp/ui/views/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:blueconnectapp/core/constants/route_paths.dart';
// Set up router for the project

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.INDEX_SCREEN :
        return MaterialPageRoute(builder: (_) => GettingStartedScreen());

      case Routes.START_UP_SCREEN:
        return MaterialPageRoute(builder: (_) => StartUpScreen());

      case Routes.LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case Routes.REGISTER_SCREEN:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case Routes.FORGOT_PASSWORD_SCREEN:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());

      case Routes.VERIFICATION_SCREEN:
        return MaterialPageRoute(builder: (_) => VerificationScreen());

      case Routes.HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case Routes.CREATE_SCREEN:
        return MaterialPageRoute(builder: (_) => CreateScreen());

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