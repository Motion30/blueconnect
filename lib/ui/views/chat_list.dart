import 'package:blueconnectapp/core/enum/chat_type.dart';
import 'package:blueconnectapp/core/veiwModels/chatview_model.dart';
import 'package:blueconnectapp/ui/shared/colors.dart';

import 'base_view.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BaseView<ChatViewModel>(
      onModelReady: (model) {
        model.pullChats();
      },
      builder: (context, model, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: model.chats.length > 0 ?
          ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: model.chats.length,
            itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: KPrimaryColor2,
                    child: Text(model.chats[0].user1 == model.username
                        ? model.chats[0].user2.substring(0,1).toUpperCase()
                        : model.chats[0].user1.substring(0,1).toUpperCase()),
                  ),
                  title: Text(
                    model.chats[0].user1 == model.username
                        ? model.chats[0].user2
                        : model.chats[0].user1,
                    style: TextStyle(
                      fontFamily: 'PoppinsRegular',
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      // Go to the chat screen
                    },
                    icon: Icon(
                      Icons.message,
                      color: KPrimaryColor2,
                    ),
                  ),
                  onTap: () {
                    //  Show the user details

                  },
                ))
        : Center(
          child: Image(
              width: 250,
              height: 250,
              fit: BoxFit.contain,
              image: AssetImage(
                "assets/images/empty.png",
              )),
        ),
      ),
    );
  }
}
