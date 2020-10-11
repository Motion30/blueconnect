import 'package:blueconnectapp/core/services/authentication_service.dart';
import 'package:blueconnectapp/locator.dart';

import 'base_model.dart';

class ProfileViewModel extends BaseModel{

  AuthenticationService _authenticationService = locator<AuthenticationService>();


  String get fullName => _authenticationService.currentUser.fullName;

  String get email => _authenticationService.currentUser.email;

  String get phone => _authenticationService.currentUser.phone;

  String get id => _authenticationService.currentUser.id;

}