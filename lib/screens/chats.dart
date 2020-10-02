import 'package:blueconnectapp/providers/user.dart';
import 'package:blueconnectapp/screens/conversation.dart';
import 'package:blueconnectapp/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chat extends StatelessWidget {
    final DatabaseMethods _databaseMethods = new DatabaseMethods();

    void getLastConversation(data){
      print(_databaseMethods.getLastConversation(data));
      print(data);
    }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: _databaseMethods.getChatRooms(Provider.of<UserProvider>(context, listen: false).username),
                  builder: (context, snapshot) {
                    return ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: snapshot.data == null? 0 : snapshot.data.docs.length,
                      itemBuilder:(context, index) => ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.black12,),
                          title: Text(snapshot.data.docs[index].get("users")[0] == Provider.of<UserProvider>(context, listen: false).username ? snapshot.data.docs[index].get("users")[1] : snapshot.data.docs[index].get("users")[0]),
                          subtitle: Text("Howfar..."),
                          trailing: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: (){
                                print("Clicked");
                              },
                              icon: Icon(
                                  Icons.message,
                                  color: Colors.white,
                              ),
                              color: Colors.blue,
                            ),
                          ),
                      ),
                    );
                  },
                ),

               Divider(),
              ],
            )
        ),
    );
  }
}
