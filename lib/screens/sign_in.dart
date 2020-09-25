import 'forget_password.dart';
import 'home.dart';
import '../services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';
import 'sign_up.dart';
import '../utils/color.dart';

class SignIn extends StatefulWidget {
    static const screenId = 'sign_in';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

    final Authentication _auth = new Authentication();

    bool isLoading = false;

    final formKey = GlobalKey<FormState>();

    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

    void signInUser() async{
        if(formKey.currentState.validate()){
            setState(() {
                isLoading = true;
            });

//            _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value){
//                Navigator.of(context).pushReplacementNamed(Home.screenId);
//            });

            await Provider.of<Auth>(context, listen: false).signIn(email: emailController.text, password: passwordController.text);

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
                                  onTap: (){
                                        signInUser();
                                  },
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
                                          Navigator.of(context).pushReplacementNamed(SignUp.screenId);
                                      },
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
