import 'package:blueconnectapp/core/enum/chat_type.dart';
import 'package:blueconnectapp/core/services/navigator_service.dart';
import 'package:blueconnectapp/locator.dart';

import 'base_model.dart';

class ConversationViewModel extends BaseModel{

  int groupIndex;

  // To check if it's a community or a group
  ChatType _chatType;

  NavigationService _navigationService = locator<NavigationService>();

  // Navigate back
  void navigateBack(){
    _navigationService.goBack();
  }

  // Set the group index
  void setGroupIndex(int index){
    groupIndex = index;
    notifyListeners();
  }

  // Set chat type
  void setChatType(ChatType type){
    _chatType = type;
    notifyListeners();
  }

}