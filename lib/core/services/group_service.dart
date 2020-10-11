import 'package:blueconnectapp/core/models/group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupService {
  final CollectionReference _groupCollection = FirebaseFirestore.instance.collection("groups");

  // Create Group
  Future createGroup(Group group) async{
    try{
      await _groupCollection.doc(group.id).set(group.toJson());
    }catch(e){
      return e.message;
    }
  }

  // Update Group
  Future updateGroup(Group group) async {
    try{
      await _groupCollection.doc(group.id).update(group.toJson());
    }catch(e){
      return e.message;
    }
  }

  // Get a group
  Future getGroup({ String groupId}) async {
    try{
      var groupData = await _groupCollection.doc(groupId).get();
      return Group.fromMap(groupData.data());
    }catch(e){
      return e.message;
    }
  }

  //   Delete a group
  Future deleteGroup ({ String groupId }) async {
    try{
      await _groupCollection.doc(groupId).delete();
    }catch(e){
      return e.message;
    }
  }
}