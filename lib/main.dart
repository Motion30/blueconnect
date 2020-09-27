import 'package:blueconnectapp/providers/user.dart';
import 'package:blueconnectapp/screens/add_community.dart';
import 'package:blueconnectapp/screens/add_groups.dart';
import 'package:blueconnectapp/screens/authenticate.dart';
import 'package:blueconnectapp/screens/search.dart';
import 'package:blueconnectapp/screens/select.dart';

import 'screens/conversation.dart';
import 'screens/forget_password.dart';
import 'screens/home.dart';
import 'screens/channel.dart';
import 'screens/profile.dart';
import 'screens/settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/sign_in.dart';
import 'screens/sign_up.dart';
import 'utils/color.dart';
import 'package:provider/provider.dart';
import 'providers/auth_data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserProvider(),),
      ],
      child: MaterialApp(
            title: 'Blue Connect',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.blue,
              scaffoldBackgroundColor: KBackgroundColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),

            home: Authenticate(),

            routes: {
              Authenticate.screenId : (context) => Authenticate(),
              SignIn.screenId : (context) => SignIn(),
              Home.screenId: (context) => Home(),
              SignUp.screenId : (context) => SignUp(),
              Profile.screenId: (context) => Profile(),
              Channel.screenId: (context) => Channel(),
              Settings.screenId: (context) => Settings(),
              ForgetPassword.screenId: (context) => ForgetPassword(),
              Conversation.screenId: (context) => Conversation(),
              Select.screenId: (context) => Select(),
              AddGroup.screenId: (context) => AddGroup(),
              AddCommunity.screenId: (context) => AddCommunity(),
                Search.screenId : (context) => Search(),
            },
          )
    );
  }
}
