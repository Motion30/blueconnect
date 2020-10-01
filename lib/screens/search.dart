import 'package:blueconnectapp/providers/user.dart';
import 'package:blueconnectapp/screens/conversation.dart';
import 'package:blueconnectapp/services/database.dart';
import 'package:blueconnectapp/utils/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
    static const screenId = 'search_screen';

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

    final TextEditingController _controller = new TextEditingController();
    final DatabaseMethods _databaseMethods = new DatabaseMethods();

    final _scaffoldKey = GlobalKey<ScaffoldState>();

    bool isLoading = false;

    QuerySnapshot searchResult;

    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void createChatRoom(String username){
      String myName = Provider.of<UserProvider>(context, listen: false).username;
        if(username != myName ){
            List<String> users = [username, myName];
            String chatRoomId = getChatRoomId(username, myName);
            Map<String, dynamic> chatRoomMap = {
                'users' : users,
                'chatRoomId' : chatRoomId,
            };

            _databaseMethods.initiateChatWithAUser(chatRoomId: chatRoomId, chatRoomMap: chatRoomMap);
            Navigator.of(context).pushReplacementNamed(Conversation.screenId);
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => Conversation(username: username, picUrl: '', chatRoomId: chatRoomId, sender: myName, ),
            ));
        }else{
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('You can not send a message to yourself.')));
        }

  }


  void search(){
        setState(() {
          isLoading = true;
        });

        if(_controller.text.isNotEmpty){
            _databaseMethods.getUserByUsername(_controller.text).then((value) {
                setState(() {
                    isLoading = false;
                    searchResult = value;
                });
            } );
        }else{
            setState(() {
                isLoading = false;
            });

            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Enter a search query.')));
        }
  }

  Widget searchList(){
        return searchResult != null ?  ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => ListTile(
                leading: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                    ),
                  child: Icon(
                      Icons.person
                  ),
                ),
                title: Text("${searchResult.docs[index].get("username")}"),
                subtitle: Text('${searchResult.docs[index].get("email") ?? " " }'),
                trailing: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: KAppbarColor,
                        borderRadius: BorderRadius.circular(25),
                    ),
                    child: GestureDetector(
                        onTap: () => createChatRoom("${searchResult.docs[index].get("username")}"),
                      child: Text(
                          "Message",
                          style: TextStyle(
                              color: Colors.white
                          ),
                      ),
                    ),
                ),
            ),
            separatorBuilder: (context, int) => SizedBox(height: 10, child: Divider(),),
            itemCount: searchResult.docs.length,
        ) : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            backgroundColor: KAppbarColor,
            title: Text("Blue connect"),
        ),
        body: Container(
            child: Column(
                children: [
                    Container(
                        color: Color(0x54FFFFFF),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                            Expanded(
                              child: TextField(
                                  controller: _controller,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search ...",
                                      hintStyle: TextStyle(
                                          color: Colors.white,
                                      )
                                  ),
                              ),
                            ),

                            Container(
                                decoration: BoxDecoration(
                                    color: KAppbarColor.withOpacity(.6),
                                    shape: BoxShape.circle,
                                ),
                              child: IconButton(
                                  color: Colors.white,
                                icon: Icon(Icons.search),
                                onPressed: search,
                              ),
                            ),
                        ],
                      ),
                    ),

                    Expanded(child: isLoading? Container(child: Center(child: CircularProgressIndicator()),) : searchList()),
                ],
            ),
        ),
    );
  }

  String getChatRoomId(String a, String b){
        String format = '';
        if(a.substring(0,1).codeUnitAt(0) > b.substring(0,1).codeUnitAt(0)){
            format = "$b\_$a";
        }else{
            format = "$a\_$b";
        }
        return format;
  }
}
