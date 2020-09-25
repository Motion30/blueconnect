import 'package:blueconnectapp/services/http_exception.dart';
import 'package:flutter/foundation.dart';
import '../requests/auth.dart';

class Auth with ChangeNotifier {
    String _token;
    DateTime _expiryDate;
    String _userId;

    Future<void> signUp ({ String email, String password }) async {
        try{
            await AuthRequest.signUp(email: email, password: password);
        }catch(error){
            throw HttpException(message: error.message);
        }
    }

    Future<void>  signIn ({ String email, String password }) async {
        try{
            await AuthRequest.signIn(email: email, password: password);
        }catch(error){
            throw HttpException(message: error.message);
        }
    }

    bool get isAuth {
        /// if we have a token and the token isn't expired then return true else return false
        return token != null;
    }

    /// Token getter
    String get token{
        if(_expiryDate != null && _expiryDate.isAfter(DateTime.now()) && _token != null) {
            return _token;
        }

        return null;
    }
}