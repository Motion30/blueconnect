import 'package:blueconnectapp/core/veiwModels/signUpViewModel.dart';
import 'package:blueconnectapp/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'base_view.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      onModelReady: (model) { /**/},
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 80,),

                Text(
                  "Sign Up",
                  style: TextStyle(
                      color: KPrimaryColor2,
                      fontSize: 24,
                      fontFamily: "PoppinsSemiBold"
                  ),
                ),

                SizedBox(height: 10,),

                Text(
                  "Enter your information below to sign up",
                  style: TextStyle(
                      color: KSecondaryColorDarkShade,
                      fontFamily: "PoppinsMedium"
                  ),
                ),

                SizedBox(
                  height: 50,
                ),

                Text(
                  "USERNAME",
                  style: TextStyle(
                      color: KPrimaryColor2,
                      fontFamily: "PoppinsBold"
                  ),
                ),

                TextFormField(
                ),

                SizedBox(height: 30,),

                Text(
                  "PHONE",
                  style: TextStyle(
                      color: KPrimaryColor2,
                      fontFamily: "PoppinsBold"
                  ),
                ),

                TextFormField(
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
                ),

                SizedBox(height: 20,),

                Text(
                  "Forgot Password?",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: KPrimaryColor2,
                      fontFamily: "PoppinsSemiBold"
                  ),
                ),

                SizedBox(height: 30,),

                GestureDetector(
                  onTap: (){
                  //  Add a function here to navigate to verification screen
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    decoration: BoxDecoration(
                      color: KPrimaryColor2,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      child: Text(
                        "SIGN UP",
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
                  //  Add a function in the view model to navigate to the login
                      model.navigateToLogin();
                  },
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                    color: KSecondaryColorDarkShade,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                )
                            ),
                            TextSpan(
                                text: "Sign in",
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
      ),
    );
  }
}
