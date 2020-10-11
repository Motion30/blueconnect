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

  Future getUser({ String uid }) async {
    try{
      var userData = await _usersCollection.doc(uid).get();
      print(userData.data());
      return AppUser.fromData(userData.data());
    }catch(e){
      // return e.message;
      print(e.toString());
    }
  }
}