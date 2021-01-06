import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Produto with ChangeNotifier {
  String id;
  String nome;
  int quantidade;
  String categoria;
  bool iscomplete;
  double price;

  Produto(
      {this.id,
      @required this.nome,
      @required this.quantidade,
      @required this.categoria,
      @required this.iscomplete,
      @required this.price});

  void _toggleComplete(String token) {
    iscomplete = !iscomplete;
    notifyListeners();
  }

  Future<void> toggleCompleteProduct(
      String token, compra, String userId) async {
    _toggleComplete(token);
    var shopId = compra.id;

    try {
      final response = await http.patch(
          'https://flutter-minhascompras.firebaseio.com/shops/$userId/$shopId.json?auth=$token',
          body: json.encode({
            'products': compra.listadeprodutos
                .map((product) => {
                      'id': product.id,
                      'nome': product.nome,
                      'quantidade': product.quantidade,
                      'categoria': product.categoria,
                      'iscomplete': product.iscomplete,
                      'price': product.price
                    })
                .toList()
          }));

      if (response.statusCode >= 400) {
        _toggleComplete(token);
      }
    } catch (error) {
      _toggleComplete(token);
    }
  }

  //metodo para apenas completar o produto, quando o preço for setado
  Future<void> toggleCompleteEditProduct(
      String token, compra, String userId) async {
    iscomplete = true;
    notifyListeners();

    var shopId = compra.id;

    try {
      final response = await http.patch(
          'https://flutter-minhascompras.firebaseio.com/shops/$userId/$shopId.json?auth=$token',
          body: json.encode({
            'products': compra.listadeprodutos
                .map((product) => {
                      'id': product.id,
                      'nome': product.nome,
                      'quantidade': product.quantidade,
                      'categoria': product.categoria,
                      'iscomplete': product.iscomplete,
                      'price': product.price
                    })
                .toList()
          }));

      if (response.statusCode >= 400) {
        _toggleComplete(token);
      }
    } catch (error) {
      _toggleComplete(token);
    }
  }
}
