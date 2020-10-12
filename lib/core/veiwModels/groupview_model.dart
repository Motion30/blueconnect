import 'package:blueconnectapp/core/enum/view_state.dart';
import 'package:blueconnectapp/core/models/group.dart';
import 'package:blueconnectapp/core/services/authentication_service.dart';
import 'package:blueconnectapp/core/services/group_service.dart';
import 'package:blueconnectapp/locator.dart';

import 'base_model.dart';

class GroupViewModel extends BaseModel{

  List<Group> groups = [];

  GroupService _groupService = locator<GroupService>();
  AuthenticationService _authenticationService = locator<AuthenticationService>();

  String get user => _authenticationService.currentUser.id;

  void listenToGroups(){
    setState(ViewState.Busy);

    _groupService.getGroups().listen((groupData) {
      List<Group> updatedGroups = groupData;
      if(updatedGroups != null  && updatedGroups.length > 0){
        groups = updatedGroups;
        notifyListeners();
      }
    });

    setState(ViewState.Idle);
  }


}