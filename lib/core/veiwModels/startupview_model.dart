import 'package:blueconnectapp/core/constants/route_paths.dart';
import 'package:blueconnectapp/core/services/navigator_service.dart';
import 'package:blueconnectapp/locator.dart';

import 'base_model.dart';

class StartUpViewModel extends BaseModel{
  NavigationService _navigationService = locator<NavigationService>();

  void navigateToGetStarted() {
    _navigationService.navigateTo(Routes.START_UP_SCREEN);
  }

  void navigateToSignIn() {
    _navigationService.navigateTo(Routes.LOGIN_SCREEN);
  }
}