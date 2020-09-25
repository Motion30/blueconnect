import 'dart:convert';

import 'package:http/http.dart';

class AuthRequest {
    static const API_KEY = 'AIzaSyDIho20d4HEP8NfKrrmJZm9BURu3LCLrRs';

    /// Auth request for SignUp
    ///
    static Future<void>  signUp({ String email, String password}) async{
        const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$API_KEY';
        Response response = await post(url, body: jsonEncode({
            'email' : email,
            'password' : password,
            'returnSecureToken' : true
        }));

        final responseData = jsonDecode(response.body);

        if (responseData['error'] != null) {

        }
    }

    /// Auth request for SignIn
    ///
    static Future<void> signIn({ String email, String password }) async{
        const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$API_KEY';
        Response response = await post(url, body: jsonEncode({
            'email' : email,
            'password' : password,
            'returnSecureToken' : true,
        }));

        print(jsonDecode(response.body));
    }
}