import 'package:blueconnectapp/core/models/chat.dart';
import 'package:blueconnectapp/core/services/authentication_service.dart';
import 'package:blueconnectapp/core/services/navigator_service.dart';
import 'package:blueconnectapp/locator.dart';

import 'base_model.dart';

class ChatScreenViewModel extends BaseModel{

  NavigationService _navigationService = locator<NavigationService>();
  AuthenticationService _authenticationService = locator<AuthenticationService>();

  List<Chat> chats = [];

  String get user => _authenticationService.currentUser.id;

  String _chatId = '';

  void navigateBack(){
    _navigationService.goBack();
  }

  void setChatId({ String username, String friend }){
    if(username.codeUnitAt(0) > friend.codeUnitAt(0)){
      _chatId = '$username\_$friend';
    }else{
      _chatId = '$friend\_$username';
    }
    notifyListeners();
  }

  void pullChats(){

  }

  Future sendMessage({ String message }) async {

  }


}