import 'package:blueconnectapp/core/veiwModels/signUpViewModel.dart';
import 'package:blueconnectapp/ui/shared/colors.dart';
import 'package:blueconnectapp/ui/widgets/input_label.dart';
import 'package:blueconnectapp/ui/widgets/round_btn.dart';
import 'package:flutter/material.dart';
import 'base_view.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _username = TextEditingController();
  TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      onModelReady: (model) {
        /**/
      },
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      color: KPrimaryColor2,
                      fontSize: 24,
                      fontFamily: "PoppinsSemiBold"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter your information below to sign up",
                  style: TextStyle(
                      color: KSecondaryColorDarkShade,
                      fontFamily: "PoppinsMedium"),
                ),
                SizedBox(
                  height: 50,
                ),

                InputLabel(
                  label: "EMAIL",
                ),

                TextFormField(

                ),

                SizedBox(
                  height: 30,
                ),

                InputLabel(
                  label: "USERNAME",
                ),
                TextFormField(

                ),
                SizedBox(
                  height: 30,
                ),
                InputLabel(
                  label: "PHONE",
                ),
                TextFormField(),
                SizedBox(
                  height: 30,
                ),
                InputLabel(
                  label: "PASSWORD",
                ),
                TextFormField(
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Forgot Password?",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: KPrimaryColor2, fontFamily: "PoppinsSemiBold"),
                ),
                SizedBox(
                  height: 30,
                ),
                RoundButton(
                  btnTitle: "SIGN UP",
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    //  Add a function in the view model to navigate to the login
                    model.navigateToLogin();
                  },
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                                color: KSecondaryColorDarkShade,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        TextSpan(
                            text: "Sign in",
                            style: TextStyle(
                                color: KPrimaryColor2,
                                fontSize: 16,
                                fontWeight: FontWeight.w600))
                      ])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
