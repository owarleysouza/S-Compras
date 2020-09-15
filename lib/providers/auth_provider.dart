import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDN_eMHVzkyQAb3w_HgejZo3ZsVIxb4YPg';

  Future<void> signup(String email, String password) async {
    final response = await http.post(_url,
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true}));

    print(json.decode(response.body));

    return Future.value();
  }
}
