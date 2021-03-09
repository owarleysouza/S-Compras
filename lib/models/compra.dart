import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:minhas_compras/utils/constants_key.dart';

class Compra with ChangeNotifier {
  String id;
  String nome;
  DateTime data;
  bool iscompleted;
  double totalPrice;
  List listadeprodutos;

  Compra({
    this.id,
    @required this.nome,
    @required this.data,
    @required this.iscompleted,
    @required this.totalPrice,
    @required this.listadeprodutos,
  });

  void _toggleComplete(String token) {
    iscompleted = !iscompleted;
    notifyListeners();
  }

  Future<void> toggleCompleteShop(String token, String userId) async {
    _toggleComplete(token);

    try {
      final response = await http.patch(
          '${Constants.BASE_API_URL}/shops/$userId/$id.json?auth=$token',
          body: json.encode({
            'name': nome,
            'date': data.toString(),
            'iscompleted': iscompleted
          }));

      if (response.statusCode >= 400) {
        _toggleComplete(token);
      }
    } catch (error) {
      _toggleComplete(token);
    }
  }
}
