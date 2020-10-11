import 'package:blueconnectapp/core/services/navigator_service.dart';
import 'package:blueconnectapp/locator.dart';

import 'base_model.dart';

class AddViewModel extends BaseModel{
    NavigationService _navigationService = locator<NavigationService>();

    void navigateBack(){
      _navigationService.goBack();
    }
}