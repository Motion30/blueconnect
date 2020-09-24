import 'package:blueconnectapp/screens/profile.dart';

import '../screens/sign_in.dart';
import '../utils/color.dart';
import '../services/auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
    static const screenId = 'sign_up';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

    bool isLoading = false;

    Authentication auth = new Authentication();

    final formKey = GlobalKey<FormState>();

    TextEditingController usernameController = new TextEditingController();
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

    void signUpUser(){
//        Validate the form fields
        if(formKey.currentState.validate()){
            setState(() {
              isLoading = true;
            });

            auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value){
                Navigator.of(context).pushReplacementNamed(Profile.screenId);
            });
        }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: KAppbarColor,
            title: Text('Sign Up'),
        ),
        body: isLoading ? Container(
            child: Center(
                child: CircularProgressIndicator(

                ),
            ),
        ) : Container(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                            Form(
                                key: formKey,
                              child: Column(
                                children: [
                                    TextFormField(
                                        style: TextStyle(
                                            color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                            hintText: "Username",
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
                                        controller: usernameController,
                                        validator: (val){
                                            return val.isEmpty || val.length < 2 ? "Please provide username greater" : null;
                                        },
                                    ),

                                    TextFormField(
                                        style: TextStyle(
                                            color: Colors.white,
                                        ),
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
                                        controller: emailController,
                                        validator: (val){
                                            return RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ? null :  "Please provide a valid email";
                                        },
                                    ),

                                    TextFormField(
                                        obscureText: true,
                                        style: TextStyle(
                                            color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                            hintText: "Password",
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
                                        controller: passwordController,
                                        validator: (val){
                                            return val.length < 6 ? "Password length must be greater than 5" : null;
                                        },
                                    ),
                                ],
                              ),
                            ),

                            SizedBox(height: 16),

                            GestureDetector(
                                onTap: (){},
                                  child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                          child: Text("Forgot Password", style: TextStyle(color: Colors.white),),
                                      ),
                                  ),
                            ),

                            SizedBox(height: 16,),

                            GestureDetector(
                                onTap: (){ signUpUser(); },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(Radius.circular(50))
                                  ),
                                  child: Text(
                                      "Sign Up",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                      ),
                                  ),
                              ),
                            ),

                            SizedBox(height: 16,),

                            GestureDetector(
                                onTap: () {},
                              child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(50))
                                  ),
                                  child: Text(
                                      "Sign Up with Google",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                      ),
                                  ),
                              ),
                            ),

                            SizedBox(height: 16,),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                    Text(
                                        "Already have an account? ",
                                        style: TextStyle(
                                            color: Colors.white,
                                        ),
                                    ),

                                    GestureDetector(
                                        onTap: (){
                                            Navigator.of(context).pushReplacementNamed(SignIn.screenId);
                                        },
                                      child: Text(
                                          "Login now",
                                          style: TextStyle(
                                              color: Colors.white,
                                              decoration: TextDecoration.underline,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                          ),
                                      ),
                                    ),
                                ],
                            ),
                            SizedBox(height: 50,),
                        ],
                    ),
                ),
            ),
        ),
    );
  }
}
