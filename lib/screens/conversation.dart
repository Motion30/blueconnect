import 'package:blueconnectapp/services/database.dart';
import 'package:blueconnectapp/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Conversation extends StatefulWidget {
    static const screenId = 'conversation_screen';

    final String username;
    final String picUrl;
    final String sender;

    final String chatRoomId;

  const Conversation({ Key key, this.username, this.picUrl, this.chatRoomId, this.sender }) : super(key: key);

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {

    final TextEditingController _controller = new TextEditingController();
    final DatabaseMethods _databaseMethods = new DatabaseMethods();

    void sendMessage(){
        if(_controller.text.isNotEmpty){
            Map<String, String> data = {
                'sender' : widget.sender,
                'message' : _controller.text,
            };
            _databaseMethods.getPersonalConversations(widget.chatRoomId, data);
        }
    }

    Widget chatList(){


    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back, color: Colors.white,),
                    color: Colors.white,
                ),
            ),

            title: Container(
                alignment: Alignment.centerLeft,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        CircleAvatar(backgroundColor: Colors.white70,),
                        SizedBox(width: 10,),
                        Text("${widget.username}")
                    ],
                ),
            ),

            actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                      onPressed: (){},
                      icon: Icon(
                          Icons.search
                      ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                      onPressed: (){},
                      icon: Icon(
                          Icons.more_vert
                      ),
                  ),
                )
            ],
        ),

        body: Container(
            child: Stack(
                children: [
                    Container(
                        alignment: Alignment.bottomCenter,
                      child: Container(
                          color: Color(0xFF82C6DD),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                              children: [
                                  Expanded(
                                      child: TextField(
                                          controller: _controller,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Enter message ...",
                                              hintStyle: TextStyle(
                                                  color: Colors.white,
                                              )
                                          ),
                                      ),
                                  ),

                                  Container(
                                      decoration: BoxDecoration(
                                          color: KAppbarColor,
                                          shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.send),
                                          onPressed: sendMessage,
                                      ),
                                  ),
                              ],
                          ),
                      ),
                    ),
                ],
            )
        ),
    );
  }
}
