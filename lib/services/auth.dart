//Import the firebase package
import 'package:blueconnectapp/providers/user.dart';
import 'package:provider/provider.dart';

import '../models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'http_exception.dart';

class Authentication{
    final FirebaseAuth _auth = FirebaseAuth.instance;

    UserModel _userFromFirebaseUser(User user){
        return user != null ? UserModel(userId: user.uid) : null;
    }

    Future signInWithEmailAndPassword({String email, String password}) async{
        try{
            UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
            User firebaseUser = result.user;
            return _userFromFirebaseUser(firebaseUser);
        }catch(e){
            print(e.toString());
            throw HttpException(message: e.toString());
        }
    }

    Future signUpWithEmailAndPassword({String email, String password }) async {
        try{
            UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
            User firebaseUser = result.user;
            return _userFromFirebaseUser(firebaseUser);
        }catch(e){
            print(e.toString());
            throw HttpException(message: e.toString());
        }
    }

    Future resetPassword({String email}) async {
        try{
            return await _auth.sendPasswordResetEmail(email: email);
        }catch(e){
            print(e.toString());
            throw HttpException(message: e.toString());
        }
    }

    Future signOut() async{
        try{
            return await _auth.signOut();
        }catch(e){
            print(e.toString());
            throw HttpException(message: e.toString());
        }
    }


}