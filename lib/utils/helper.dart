import 'package:shared_preferences/shared_preferences.dart';

class Helper {
    static String sharedPreferenceUserLoginKey = '';
    static String sharedPreferenceUsernameKey = '';
    static String sharedPreferenceUserEmailKey = '';

    static Future<void> saveUserLoggedInSharedPreference (bool isUserLoggedIn) async{
        SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
        return await _sharedPreferences.setBool(sharedPreferenceUserLoginKey, isUserLoggedIn);
    }

    static Future<void> saveUsernameSharedPreference (String username) async{
        SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
        return await _sharedPreferences.setString(sharedPreferenceUsernameKey, username);
    }

    static Future<void> saveUserEmailSharedPreference (String userEmail) async{
        SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
        return await _sharedPreferences.setString(sharedPreferenceUserEmailKey, userEmail);
    }

    static Future<bool> get userLoggedInSharedPreference async{
        SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
        return _sharedPreferences.getBool(sharedPreferenceUserLoginKey);
    }

    static Future<String> get usernameSharedPreference async{
        SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
        return _sharedPreferences.getString(sharedPreferenceUsernameKey);
    }

    static Future<String> get userEmailSharedPreference async{
        SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
        return _sharedPreferences.getString(sharedPreferenceUserEmailKey);
    }
}