import 'package:flutter/foundation.dart';

class Chat{
  final String message;
  final String sender;
  // final String username;
  final DateTime timeSent;
  final bool isImage;

  Chat({
    @required this.message,
    @required this.sender,
    // @required this.username,
    @required this.timeSent,
    @required this.isImage
  });

  Chat.fromMap(Map<String, dynamic> data)
    : message  =  data['message'],
      sender   =  data['sender'],
      // username =  data['username'],
      timeSent =  DateTime.tryParse(data['timeSent']),
      isImage  =  data['isImage'];


  Map<String, dynamic> toJson(){
    return {
      'message'  :  message,
      'sender'   :  sender,
      // 'username' :  username,
      'timeSent' :  timeSent.toString(),
      'isImage'  :  isImage,
    };
  }
}