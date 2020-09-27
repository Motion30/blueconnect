import 'package:flutter/foundation.dart';


class UserProvider with ChangeNotifier{
    String _username;
    String _userId;
    String _email;
    String _firstName;
    String _lastName;
    String _phone;
    bool _isLoggedIn;

    void saveUserName(String username){
        _username = username;
        notifyListeners();
    }

    String get username{
        return _username;
    }

    void saveUserEmail(String userEmail){
        _email = userEmail;
        notifyListeners();
    }

    String get userEmail{
        return _email;
    }

    void saveUserPhone(String phone){
        _phone = phone;
        notifyListeners();
    }

    String get userPhone{
        return _phone;
    }

    void saveFirstName(String firstName){
        _firstName = firstName;
        notifyListeners();
    }

    String get firstName{
        return _firstName;
    }

    void saveLastName(String lastName){
        _lastName = lastName;
        notifyListeners();
    }

    get userLastName{
        return _lastName;
    }

    void saveUserId(String userId){
        _userId = userId;
        notifyListeners();
    }

    String get userId{
        return _userId;
    }

    void setLoggedInStatus( bool value){
        _isLoggedIn = value;
        notifyListeners();
    }

    bool get isLoggedIn{
        return _isLoggedIn;
    }
}