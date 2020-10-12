import 'package:blueconnectapp/core/services/dialog_service.dart';
import 'package:blueconnectapp/core/services/group_service.dart';
import 'package:blueconnectapp/core/services/navigator_service.dart';
import 'package:blueconnectapp/locator.dart';

import 'base_model.dart';

class AddViewModel extends BaseModel{
    NavigationService _navigationService = locator<NavigationService>();
    DialogService _dialogService = locator<DialogService>();
    GroupService _groupService = locator<GroupService>();

    void navigateBack(){
      _navigationService.goBack();
    }


}