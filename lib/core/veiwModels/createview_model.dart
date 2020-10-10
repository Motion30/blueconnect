import 'package:blueconnectapp/core/constants/route_paths.dart';
import 'package:blueconnectapp/core/services/navigator_service.dart';
import 'package:blueconnectapp/locator.dart';

import 'base_model.dart';

class CreateViewModel extends BaseModel{

  NavigationService _navigationService = locator<NavigationService>();

  bool _isSearchActive = false;

  bool get isSearch => _isSearchActive;

  void raiseSearch(){
    _isSearchActive = true;
    notifyListeners();
  }

  void dropSearch(){
    _isSearchActive = false;
    notifyListeners();
  }

  void navigateToAddScreen(){
    _navigationService.navigatorKey.currentState.pushNamed(Routes.ADD_GROUP_SCREEN);
  }

}