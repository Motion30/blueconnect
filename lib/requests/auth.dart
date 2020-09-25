import 'dart:convert';
import '../services/http_exception.dart';
import 'package:http/http.dart';

class AuthRequest {
    static const API_KEY = 'AIzaSyDIho20d4HEP8NfKrrmJZm9BURu3LCLrRs';

    /// Auth request for SignUp
    ///
    static Future<Map<String, dynamic>>  signUp({ String email, String password}) async{
        try{
            const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$API_KEY';
            Response response = await post(url, body: jsonEncode({
                'email' : email,
                'password' : password,
                'returnSecureToken' : true
            }));

            final responseData = jsonDecode(response.body);

            if (responseData['error'] != null) {
                throw  HttpException(message: responseData['error']['message']);
            }

            final result = {};

            result['idToken'] = responseData['idToken'];
            result['userId'] = responseData['localId'];
            result['expiryDate'] = DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn'])));

            return result;
        }catch(error){
            throw error;
        }
    }

    /// Auth request for SignIn
    ///
    static Future<Map<String, dynamic>> signIn({ String email, String password }) async{
        try{
            const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$API_KEY';
            Response response = await post(url, body: jsonEncode({
                'email' : email,
                'password' : password,
                'returnSecureToken' : true,
            }));

            final responseData = jsonDecode(response.body);

            if(responseData['error'] != null) {
                throw HttpException(message: responseData['error']['message']);
            }

            final result = {};

            result['idToken'] = responseData['idToken'];
            result['userId'] = responseData['localId'];
            result['expiryDate'] = DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn'])));

            return result;
        }catch(error){
            throw error;
        }
    }
}