import 'package:blueconnectapp/core/models/chat.dart';
import 'package:blueconnectapp/core/services/authentication_service.dart';
import 'package:blueconnectapp/core/services/community_service.dart';
import 'package:blueconnectapp/core/services/group_service.dart';
import 'package:blueconnectapp/core/services/navigator_service.dart';
import 'package:blueconnectapp/core/veiwModels/groupview_model.dart';
import 'package:blueconnectapp/locator.dart';

import 'base_model.dart';

class ConversationViewModel extends BaseModel{

  NavigationService _navigationService = locator<NavigationService>();
  GroupViewModel _groupViewModel = locator<GroupViewModel>();
  CommunityService _communityService = locator<CommunityService>();
  AuthenticationService _authenticationService = locator<AuthenticationService>();
  GroupService _groupService = locator<GroupService>();

  int groupIndex;

  List<Chat> chats = [];

  String get user => _authenticationService.currentUser.id;

  // Navigate back
  void navigateBack(){
    _navigationService.goBack();
  }

  // Set the group index
  void setGroupIndex(int index){
    groupIndex = index;
    notifyListeners();
  }

  // Send message
  Future sendCommunityMessage({ String message }) async{
    var communityId = _groupViewModel.combined[groupIndex].id;
    var result = await _communityService.addCommunityChat(chat: Chat(
        message: message,
        sender: _authenticationService.currentUser.id,
        timeSent: DateTime.now(),
        isImage: false
        ),
        communityId: communityId
    );
  }

  void pullCommunityChats(){
      var communityId = _groupViewModel.combined[groupIndex].id;
      _communityService.getCommunityChats(communityId: communityId).listen((communityChatData) {
        List<Chat> updatedChats = communityChatData;
        if(updatedChats != null  && updatedChats.length > 0){
          chats = [...updatedChats.reversed];
          notifyListeners();
        }
      });
  }

  void pullGroupChats(){

  }

}