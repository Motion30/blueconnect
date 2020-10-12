import 'dart:async';
import 'package:blueconnectapp/core/models/channel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ChannelService {

  final CollectionReference _channelCollection = FirebaseFirestore.instance.collection("channels");

  // Create a stream controller that would broadcast our groups
  final StreamController<List<Channel>> _channelController = StreamController<List<Channel>>.broadcast();

  // Create Group
  Future createChannel(Channel channel) async{
    try{
      await _channelCollection.doc(channel.id).set(channel.toJson());
      return true;
    }catch(e){
      return e.message;
    }
  }

  // Update Group
  Future updateChannel(Channel channel) async {
    try{
      await _channelCollection.doc(channel.id).update(channel.toJson());
      return true;
    }catch(e){
      return e.message;
    }
  }

  // Get a group
  Future getChannel({ String channelId}) async {
    try{
      var channelData = await _channelCollection.doc(channelId).get();
      return Channel.fromMap(channelData.data());
    }catch(e){
      return e.message;
    }
  }

  //   Delete a group
  Future deleteGroup ({ String channelId }) async {
    try{
      await _channelCollection.doc(channelId).delete();
      return true;
    }catch(e){
      return e.message;
    }
  }

  //   Get all groups [STREAM]
  Stream getGroups(){
    // Request for the snapshots
    _channelCollection.snapshots().listen((chanelSnapshots) {
      //Check if it has data
      if(chanelSnapshots.docs.isNotEmpty){
        var channels = chanelSnapshots.docs.map((snapshot) => Channel.fromMap(snapshot.data())).toList();
        _channelController.add(channels);
      }
    });

    // Return the stream underlying our _groupController
    return _channelController.stream;
  }

  Future addChannelChat() async {

  }
}