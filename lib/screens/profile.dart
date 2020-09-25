import '../screens/sign_in.dart';
import '../services/auth.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import '../utils/color.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
    static const screenId = 'profile_screen';

    final Authentication auth = new Authentication();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
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

            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Form(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'First Name',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16
                                  ),
                              ),
                          ),

                          TextFormField(
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(12),
                                          right: Radius.circular(12),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.black12
                                      )
                                  )
                              ),
                          ),

                          SizedBox(height: 10,),

                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Last Name',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16
                                  ),
                              ),
                          ),

                          TextFormField(
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(12),
                                          right: Radius.circular(12),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.black12
                                      )
                                  )
                              ),
                          ),

                          SizedBox(height: 10,),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Username',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16
                                ),
                            ),
                          ),

                          TextFormField(
                            style: TextStyle(
                                color: Colors.white
                            ),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(12),
                                        right: Radius.circular(12),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.black12
                                    )
                                )
                            ),
                          ),

                          SizedBox(height: 10,),

                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Email',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16
                                  ),
                              ),
                          ),

                          TextFormField(
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(12),
                                          right: Radius.circular(12),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.black12
                                      )
                                  ),
                              ),
                          ),

                          SizedBox(height: 40,),

                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  color: KAppbarColor,
                                  borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Icon(
                                        Icons.save,
                                        color: Colors.white,
                                        size: 28,
                                    ),

                                    SizedBox(width: 20,),

                                    Text(
                                        'Save',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22
                                        ),
                                    ),
                                ],
                              ),
                          ),

                      ],
                  ),
                ),
            ),
        );
    }
}
