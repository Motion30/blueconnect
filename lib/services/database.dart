import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
    getUserByUsername(String username){

    }

    uploadUserInfo(Map<String, String> data){
        FirebaseFirestore.instance.collection("users").add(data);
    }
}