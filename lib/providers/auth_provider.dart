import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:minhas_compras/exceptions/auth_exception.dart';

class AuthProvider with ChangeNotifier {
  String _userId;
  String _token;
  DateTime _expiryDate;

  bool get isAuth {
    return token != null;
  }

  String get userId {
    return isAuth ? _userId : null;
  }

  String get token {
    if (_token != null &&
        _expiryDate != null &&
        _expiryDate.isAfter(DateTime.now())) {
      return _token;
    } else {
      return null;
    }
  }

  Future<void> authenticate(
      String email, String password, String urlSegment) async {
    final _url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDN_eMHVzkyQAb3w_HgejZo3ZsVIxb4YPg';

    final response = await http.post(_url,
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true}));

    final responseBody = json.decode(response.body);

    if (responseBody["error"] != null) {
      throw AuthException(responseBody["error"]["message"]);
    } else {
      _token = responseBody["idToken"];
      _userId = responseBody["localId"];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseBody["expiresIn"])));
      notifyListeners();
    }

    return Future.value();
  }

  Future<void> login(String email, String password) async {
    return authenticate(email, password, "signInWithPassword");
  }

  Future<void> signup(String email, String password) async {
    return authenticate(email, password, "signUp");
  }

  void logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    notifyListeners();
  }
}
