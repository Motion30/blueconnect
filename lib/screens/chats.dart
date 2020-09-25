import 'package:blueconnectapp/screens/conversation.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: GestureDetector(
                onTap: (){
                    Navigator.of(context).pushNamed(Conversation.screenId);
                },
              child: Column(
                children: [
                  ListTile(
                      leading: CircleAvatar(backgroundColor: Colors.black12,),
                      title: Text("Kenechi"),
                      subtitle: Text(
                          "Howfar na where you con go since wey I con de find you like mumu.",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(

                          ),
                      ),
                      trailing: Text("March, 2021"),
                  ),

                 Divider(),
                ],
              ),
            )
        ),
    );
  }
}
