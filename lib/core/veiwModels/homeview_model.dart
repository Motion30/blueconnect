import 'package:blueconnectapp/core/constants/route_paths.dart';
import 'package:blueconnectapp/core/services/navigator_service.dart';
import 'package:blueconnectapp/locator.dart';

import 'base_model.dart';

class HomeViewModel extends BaseModel{
  NavigationService _navigationService = locator<NavigationService>();

   void navigateToCreateScreen(){
     _navigationService.navigatorKey.currentState.pushNamed(Routes.CREATE_SCREEN);
   }

   Future signOut() async{

   }
}