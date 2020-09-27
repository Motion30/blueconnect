import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
    Future<QuerySnapshot> getUserByUsername(String username) async{
        return await FirebaseFirestore.instance.collection("users").where('username', isGreaterThanOrEqualTo: username).get();
    }

    Future<QuerySnapshot> getUserByEmail(String email) async{
        return await FirebaseFirestore.instance.collection("users").where('email', isEqualTo: email).get();
    }

    void uploadUserInfo(Map<String, String> data, String userId){
        FirebaseFirestore.instance.collection("users").doc(userId).set(data).catchError((e){
            print(e.toString());
        });
    }

    void initiateChatWithAUser({ String chatRoomId, Map<String, String> chatRoomMap }){
        FirebaseFirestore.instance.collection("chatMaps").doc(chatRoomId).set(chatRoomMap).catchError((e){
            print(e.toString());
        });

    }


}