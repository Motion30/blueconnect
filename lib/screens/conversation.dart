import 'package:blueconnectapp/services/database.dart';
import 'package:blueconnectapp/utils/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

    void sendMessage(){
        if(_controller.text.isNotEmpty){
            Map<String, dynamic> data = {
                'sender' : widget.sender,
                'message' : _controller.text,
                'time' : DateTime.now().millisecondsSinceEpoch
            };
            _databaseMethods.addPersonalConversations(widget.chatRoomId, data);
            _controller.clear();
        }
    }

    Widget chatList(){
        return StreamBuilder<QuerySnapshot>(
            stream: _databaseMethods.getPersonalConversations(widget.chatRoomId),
            builder: (context, snapshot){
                return ListView.builder(itemBuilder: (context, index){
                    return ChatMessage(message: snapshot.data.docs[index].get("message"), isSentByMe: snapshot.data.docs[index].get("sender") == widget.sender,);
                },
                itemCount: snapshot.data.docs.length,);
            },
        );
    }

    @override
  void initState() {
        super.initState();
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
//                        CircleAvatar(backgroundColor: Colors.white70,),
//                        SizedBox(width: 10,),
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
                    chatList(),
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

class ChatMessage extends StatelessWidget {
    final String message;
    final bool isSentByMe;
    const ChatMessage({Key key, this.message, this.isSentByMe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: isSentByMe? 0: 24, right: isSentByMe? 24 : 0),
      margin: EdgeInsets.symmetric(vertical: 8),
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft ,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: isSentByMe ? [ Color(0xff007EF4), Color(0xff2A75BC)] : [ Color(0x1FFFFFF), Color(0x1FFFFFF) ]
              ),
              borderRadius: isSentByMe ? BorderRadius.only(
                  topLeft: Radius.circular(23),
                  topRight: Radius.circular(23),
                  bottomLeft: Radius.circular(23)
              ) : BorderRadius.only(
                  topRight: Radius.circular(23),
                  topLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23)
              ),
          ),
          child: Text(
              message,
              style: TextStyle(
                  color: Colors.white
              ),
          ),
      ),
    );
  }
}
