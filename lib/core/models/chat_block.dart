import 'package:flutter/foundation.dart';

class ChatSet{
  final String chatId;
  final List<String> users;

  ChatSet({ @required this.chatId, @required this.users });

  ChatSet.fromMap(Map<String, dynamic> data)
    : chatId  = data['chatId'],
      users   = data['users'];

  Map<String, dynamic> toJson(){
    return {
      'chatId' : chatId,
      'users'  : users,
    };
  }
}