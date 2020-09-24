import 'package:blueconnectapp/screens/sign_in.dart';
import 'package:blueconnectapp/services/auth.dart';

import '../utils/color.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
    static const screenId = 'profile_screen';

    final Authentication auth = new Authentication();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: KAppbarColor,
                title: Text('Profile'),
                actions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: IconButton(
                          onPressed: (){
                              auth.signOut();
                              Navigator.of(context).pushReplacementNamed(SignIn.screenId);
                          },
                        icon: Icon(Icons.exit_to_app),
                      ),
                    ),
                ],
            ),
        );
    }
}
