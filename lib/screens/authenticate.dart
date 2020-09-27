import 'package:blueconnectapp/screens/sign_in.dart';
import 'package:blueconnectapp/screens/sign_up.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
    static const screenId = 'authenticate_screen';

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
    bool showSignIn = true;

    void toggleView(){
        setState(() {
          showSignIn = !showSignIn;
        });
    }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
        return SignIn(toggle: toggleView,);
    }else{
        return SignUp(toggle: toggleView,);
    }
  }
}
