import 'package:blueconnectapp/services/auth.dart';

import '../utils/color.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
    static const screenId = 'forget_password';

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

    final Authentication _auth = new Authentication();

    bool isLoading = false;

    final formKey = GlobalKey<FormState>();

    TextEditingController emailController = new TextEditingController();

    void forgotPassword(){
        if(formKey.currentState.validate()){
            setState(() {
                isLoading = true;
            });

            _auth.resetPassword(email: emailController.text).then((value){

            });
        }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: KAppbarColor,
            title: Text('Forgot Password'),
        ),

        body: isLoading? Container(
            child: Center(
                child: CircularProgressIndicator(),
            ),
        ) : Container(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                    child: Form(
                        key: formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                                TextFormField(
                                    style: TextStyle(
                                        color: Colors.white,
                                    ),
                                    controller: emailController,
                                    validator: (val){
                                        return RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ? null :  "Please provide a valid email";
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                            color: Colors.white54,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                        ),
                                    ),
                                ),

                                SizedBox(height: 50,),

                                Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(Radius.circular(50))
                                    ),
                                    child: GestureDetector(
                                        onTap: (){
                                            forgotPassword();
                                        },
                                        child: Text(
                                            "Reset Password",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                            ),
                                        ),
                                    ),
                                ),

                                SizedBox(height: 50,),
                            ],
                        ),
                    ),
                ),
            ),
        ),
    );
  }
}
