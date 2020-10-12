import 'package:blueconnectapp/core/enum/chat_type.dart';
import 'package:blueconnectapp/core/veiwModels/chatview_model.dart';

import 'base_view.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  final ChatType chat;

  ChatList({ Key key, this.chat }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<ChatViewModel>(
      builder: (context, model, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: 10,
            itemBuilder: (context, index) => ListTile(
              title: chat == ChatType.Private ? Text("James $index"): chat == ChatType.Group ? Text("Group $index") : Text("Channel $index"),
              trailing: chat == ChatType.Private ? Text("Last message"): chat == ChatType.Group ? Text("Group description") : Text("Channel description"),
              onTap: (){
                //  Go to the chat screen

              },
              subtitle: Text("News details..."),
            )
        ),
      ),
    );
  }
}
