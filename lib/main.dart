import 'ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'locator.dart';
import './ui/router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  setUpLocator();  //  Set up the locator
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
              scaffoldBackgroundColor: KPrimaryWhite,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: '/',
            onGenerateRoute: Router.generateRoute,
    );
  }
}
