import 'package:blueconnectapp/screens/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';

import 'utils/color.dart';
import 'package:flutter/material.dart';
import 'screens/sign_in.dart';

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

      },
    );
  }
}
