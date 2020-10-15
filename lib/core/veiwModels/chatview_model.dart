import 'package:blueconnectapp/core/models/chat_block.dart';
import 'package:blueconnectapp/core/services/authentication_service.dart';
import 'package:blueconnectapp/core/services/chat_service.dart';
import 'package:blueconnectapp/core/services/navigator_service.dart';
import 'package:blueconnectapp/locator.dart';

import 'base_model.dart';

class ChatViewModel extends BaseModel{
  NavigationService _navigationService = locator<NavigationService>();
  ChatService _chatService = locator<ChatService>();
  AuthenticationService _authenticationService = locator<AuthenticationService>();

  List<ChatSet> chats = [];

  String get username => _authenticationService.currentUser.fullName;

  void navigateBack(){
    _navigationService.goBack();
  }

  void pullChats(){
    _chatService.getActiveChats(userId: _authenticationService.currentUser.id).listen((chatData) {
      List<ChatSet> updatedChats = chatData;
      if(updatedChats != null  && updatedChats.length > 0){
        chats = updatedChats;
        notifyListeners();
      }
    });
  }
}