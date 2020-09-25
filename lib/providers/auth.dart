import 'package:flutter/foundation.dart';
import '../services/http_exception.dart';
import '../requests/auth.dart';

class Auth with ChangeNotifier {
    String _token;
    DateTime _expiryDate;
    String _userId;

    /// Sign user up
    Future<void> signUp ({ String email, String password }) async {
        try{
           Map<String,dynamic> result =  await AuthRequest.signUp(email: email, password: password);

           _token = result['token'];
           _userId = result['userId'];
           _expiryDate = result['expiryDate'];

           notifyListeners();
        }catch(error){
            throw HttpException(message: error.message);
        }
    }

    /// Sign user in
    Future<void>  signIn ({ String email, String password }) async {
        try{
           Map<String, dynamic> result = await AuthRequest.signIn(email: email, password: password);

            _token = result['token'];
            _userId = result['userId'];
            _expiryDate = result['expiryDate'];

            notifyListeners();
        }catch(error){
            throw HttpException(message: error.message);
        }
    }

    /// Check if the user is authenticated or not
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