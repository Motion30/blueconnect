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
            throw error;
        }
    }

    Future<void>  signIn ({ String email, String password }) async {
        await AuthRequest.signIn(email: email, password: password);
    }
}