import 'package:blueconnectapp/core/services/navigator_service.dart';
import 'package:blueconnectapp/locator.dart';

import 'base_model.dart';

class ConversationViewModel extends BaseModel{
  int groupIndex;

  NavigationService _navigationService = locator<NavigationService>();

  void navigateBack(){
    _navigationService.goBack();
  }

  // Set the group index
  void setGroupIndex(int index){
    groupIndex = index;
    notifyListeners();
  }
}