import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
    static const screenId = 'sign_up';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
    TextEditingController usernameController = new TextEditingController();
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: Text('Sign Up'),
        ),
        body:  Container(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                            Form(
                              child: Column(
                                children: [
                                    TextField(
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
                                    ),

                                    TextField(
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
                                    ),

                                    TextField(
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
                                    ),
                                ],
                              ),
                            ),

                            SizedBox(height: 16),

                            Container(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                    child: Text("Forgot Password", style: TextStyle(color: Colors.white),),
                                ),
                            ),

                            SizedBox(height: 16,),

                            Container(
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

                            SizedBox(height: 16,),

                            Container(
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

                                    Text(
                                        "Login now",
                                        style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
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
