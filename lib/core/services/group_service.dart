import 'dart:async';
import 'package:blueconnectapp/core/models/group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class GroupService {

  final CollectionReference _groupCollection = FirebaseFirestore.instance.collection("groups");

  // Create a stream controller that would broadcast our groups
  final StreamController<List<Group>> _groupController = StreamController<List<Group>>.broadcast();

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

  //   Get all groups [STREAM]
  Stream getGroups(){
      // Request for the snapshots
      _groupCollection.snapshots().listen((groupSnapshots) {
        //Check if it has data
        if(groupSnapshots.docs.isNotEmpty){
          var groups = groupSnapshots.docs.map((snapshot) => Group.fromMap(snapshot.data())).toList();

          _groupController.add(groups);
        }
      });

      // Return the stream underlying our _groupController
      return _groupController.stream;
  }
}