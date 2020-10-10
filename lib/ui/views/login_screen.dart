import 'package:blueconnectapp/core/veiwModels/signInViewModel.dart';
import 'package:blueconnectapp/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'base_view.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(builder: (context, model, child) => Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 80,),

              Text(
                "Sign in",
                style: TextStyle(
                    color: KPrimaryColor2,
                    fontSize: 24,
                    fontFamily: "PoppinsSemiBold"
                ),
              ),

              SizedBox(height: 10,),

              Text(
                "Sign in to continue",
                style: TextStyle(
                    color: KSecondaryColorDarkShade,
                    fontFamily: "PoppinsMedium"
                ),
              ),

              SizedBox(
                height: 50,
              ),

              Text(
                "EMAIL",
                style: TextStyle(
                    color: KPrimaryColor2,
                    fontFamily: "PoppinsBold"
                ),
              ),

              TextFormField(
                controller: _email,
              ),

              SizedBox(height: 30,),

              Text(
                "PASSWORD",
                style: TextStyle(
                    color: KPrimaryColor2,
                    fontFamily: "PoppinsBold"
                ),
              ),

              TextFormField(
                obscureText: true,
                controller: _password,
              ),

              SizedBox(height: 30,),

              GestureDetector(
                onTap: (){
                  model.navigateToForgotPassword();
                },
                child: Text(
                  "Forgot Password?",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: KPrimaryColor2,
                      fontFamily: "PoppinsSemiBold"
                  ),
                ),
              ),

              SizedBox(height: 30,),

              GestureDetector(
                onTap: () async{
                  await model.login(email: _email.text, password: _password.text);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  decoration: BoxDecoration(
                    color: KPrimaryColor2,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    child: Text(
                      "SIGN IN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: KPrimaryWhite,
                          fontFamily: "PoppinsRegular",
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25,),

              GestureDetector(
                onTap: (){
                  model.navigateToRegister();
                },
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                  color: KSecondaryColorDarkShade,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                              )
                          ),
                          TextSpan(
                              text: "Sign Up",
                              style: TextStyle(
                                  color: KPrimaryColor2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                              )
                          )
                        ]
                    )),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
