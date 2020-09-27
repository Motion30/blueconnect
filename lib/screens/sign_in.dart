import 'package:blueconnectapp/screens/home.dart';
import 'package:blueconnectapp/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';
import 'forget_password.dart';

class SignIn extends StatefulWidget {
    static const screenId = 'sign_in';

    final Function toggle;

    SignIn({ this.toggle });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
    bool isLoading = false;

    final formKey = GlobalKey<FormState>();

    final Authentication _auth = new Authentication();

    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

    void _showErrorDialog(String message){
        showDialog(context: context,builder: (ctx) => AlertDialog(
            title: Text('An Error Occurred.'),
            content: Text(message),
            actions: <Widget>[
                FlatButton(onPressed: (){ Navigator.of(context).pop(); }, child:  Text("Okay")),
            ],
        ));
    }

    @override
    void dispose() {
        // TODO: implement dispose
        super.dispose();
        emailController.dispose();
        passwordController.dispose();
    }

    void signInUser() async{
        if(formKey.currentState.validate()){
            setState(() {
                isLoading = true;
            });

            _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value){
                if(value.userId != null){
                    Navigator.of(context).pushReplacementNamed(Home.screenId);
                }else {
                    var errorMessage = 'Invalid username or password';
                    _showErrorDialog(errorMessage);

                    setState(() {
                        isLoading = false;
                    });
                }
            }).catchError((error){
                var errorMessage = 'Invalid username or password';
                _showErrorDialog(errorMessage);

                setState(() {
                    isLoading = false;
                });
            });

        }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: KAppbarColor,
            title: Text('Sign In'),
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

                          TextFormField(
                              style: TextStyle(
                                  color: Colors.white,
                              ),
                              controller: passwordController,
                              obscureText: true,
                              validator: (val){
                                  return val.isEmpty || val.length < 6 ? "Please provide a valid password." : null;
                              },
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
                          ),

                          SizedBox(height: 16),

                          GestureDetector(
                              onTap: (){
                                  Navigator.of(context).pushNamed(ForgetPassword.screenId);
                              },
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                    child: Text("Forgot Password", style: TextStyle(color: Colors.white),),
                                ),
                            ),
                          ),

                          SizedBox(height: 16,),

                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(Radius.circular(50))
                              ),
                              child: GestureDetector(
                                  onTap: signInUser,
                                child: Text(
                                    "Sign In",
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

                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(50))
                              ),
                              child: Text(
                                  "Sign In with Google",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                  ),
                              ),
                          ),

                          SizedBox(height: 16,),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                  Text(
                                      "Don't have an account? ",
                                      style: TextStyle(
                                          color: Colors.white,
                                      ),
                                  ),

                                  GestureDetector(
                                      onTap: (){
//                                          Navigator.of(context).pushReplacementNamed(SignUp.screenId);
                                        widget.toggle();
                                      },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                        "Register now",
                                        style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                        ),
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
        ),
    );
  }
}
