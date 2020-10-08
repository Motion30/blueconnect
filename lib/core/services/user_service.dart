import 'package:blueconnectapp/core/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection("users");

  Future createUser(AppUser user) async {
    try{
      await _usersCollection.doc(user.id).set(user.toJson());
    }catch(e){
      return e.message;
    }
  }
}