import 'package:blueconnectapp/core/models/chat.dart';
import 'package:blueconnectapp/core/services/authentication_service.dart';
import 'package:blueconnectapp/core/services/chat_service.dart';
import 'package:blueconnectapp/core/services/navigator_service.dart';
import 'package:blueconnectapp/locator.dart';

import 'base_model.dart';

class ChatScreenViewModel extends BaseModel{

  NavigationService _navigationService = locator<NavigationService>();
  AuthenticationService _authenticationService = locator<AuthenticationService>();
  ChatService _chatService = locator<ChatService>();

  List<Chat> chats = [];

  String get user => _authenticationService.currentUser.id;

  String get username => _authenticationService.currentUser.fullName;

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
    _chatService.loadChats(chatId: _chatId).listen((chatData) {
      List<Chat> updatedChats = chatData;
      if(updatedChats != null  && updatedChats.length > 0){
        chats = updatedChats;
        notifyListeners();
      }
    });
  }

  Future sendMessage({ String message }) async {
    await _chatService.messageFriend(
        chat: Chat(
              message: message,
              sender: user,
              timeSent: DateTime.now(),
              isImage: false
          ),
        chatId: _chatId);
  }


}