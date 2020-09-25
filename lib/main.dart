import 'package:blueconnectapp/screens/conversation.dart';
import 'package:blueconnectapp/screens/forget_password.dart';
import 'package:blueconnectapp/screens/home.dart';

import 'screens/channel.dart';
import 'screens/community.dart';
import 'screens/feeds.dart';
import 'screens/profile.dart';
import 'screens/settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/sign_in.dart';
import 'screens/sign_up.dart';
import 'utils/color.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blue Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: KBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignUp(),

      routes: {
        SignIn.screenId : (context) => SignIn(),
        SignUp.screenId : (context) => SignUp(),
        Profile.screenId: (context) => Profile(),
        Channel.screenId: (context) => Channel(),
        Home.screenId: (context) => Home(),
        Settings.screenId: (context) => Settings(),
        ForgetPassword.screenId: (context) => ForgetPassword(),
        Conversation.screenId: (context) => Conversation(),
      },
    );
  }
}
