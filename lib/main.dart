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
      title: 'Diva Forum',
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
        Feeds.screenId: (context) => Feeds(),
        Community.screenId: (context) => Community(),
        Settings.screenId: (context) => Settings(),
      },
    );
  }
}
