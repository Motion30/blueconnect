import 'package:blueconnectapp/core/constants/route_paths.dart';
import 'package:blueconnectapp/core/enum/view_state.dart';
import 'package:blueconnectapp/core/services/authentication_service.dart';
import 'package:blueconnectapp/core/services/navigator_service.dart';
import 'package:blueconnectapp/locator.dart';

import 'base_model.dart';

class HomeViewModel extends BaseModel{
  NavigationService _navigationService = locator<NavigationService>();
  AuthenticationService _authenticationService = locator<AuthenticationService>();

   void navigateToCreateScreen(){
     _navigationService.navigateTo(Routes.CREATE_SCREEN);
   }

   Future signOut() async{
     setState(ViewState.Busy);
      await _authenticationService.signOut();
      setState(ViewState.Idle);
      _navigationService.navigatorKey.currentState.pushReplacementNamed(Routes.LOGIN_SCREEN);
   }
   
   void navigateToProfile(){
     _navigationService.navigateTo(Routes.PROFILE_SCREEN);
   }

   void navigateToSettings(){
     _navigationService.navigateTo(Routes.SETTINGS_SCREEN);
   }
}