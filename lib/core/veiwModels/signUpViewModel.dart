import 'package:blueconnectapp/core/enum/view_state.dart';
import 'package:blueconnectapp/core/services/authentication_service.dart';
import 'package:blueconnectapp/locator.dart';
import 'package:flutter/foundation.dart';

import 'base_model.dart';

class SignUpViewModel extends BaseModel{

  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  Future signUp({ @required String email, @required String password}) async {
    setState(ViewState.Busy);

    var result = await _authenticationService.signUpWithEmail(email: email, password: password);

    setState(ViewState.Idle);

    if(result is bool){
    //  Navigate to the home view route
    }else{

    }
  }
}