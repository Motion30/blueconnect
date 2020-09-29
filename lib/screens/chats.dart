import 'package:blueconnectapp/providers/user.dart';
import 'package:blueconnectapp/screens/conversation.dart';
import 'package:blueconnectapp/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chat extends StatelessWidget {
    final DatabaseMethods _databaseMethods = new DatabaseMethods();

    Widget getLastConvo(QuerySnapshot docs){
        return Text(
            '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(

            ),
        );
    }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
              children: [
                GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(Conversation.screenId),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _databaseMethods.getChatRooms(Provider.of<UserProvider>(context, listen: false).username),
                    builder: (context, snapshot) {
                      return ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: snapshot.data.docs.length,
                        itemBuilder:(context, index) => ListTile(
                            leading: CircleAvatar(backgroundColor: Colors.black12,),
                            title: Text(snapshot.data.docs[index].get("users")[0] == Provider.of<UserProvider>(context, listen: false).username ? snapshot.data.docs[index].get("users")[1] : snapshot.data.docs[index].get("users")[0]),
                            subtitle: Text(
                                'Howfar ...',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(

                                ),
                            ),
                            trailing: Text("March, 2021"),
                        ),
                      );
                    },
                  ),
                ),

               Divider(),
              ],
            )
        ),
    );
  }
}
