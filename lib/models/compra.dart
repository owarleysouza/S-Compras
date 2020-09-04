import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Compra with ChangeNotifier {
  String id;
  String nome;
  DateTime data;
  bool iscompleted;
  List listadeprodutos;

  Compra({
    this.id,
    @required this.nome,
    @required this.data,
    @required this.iscompleted,
    @required this.listadeprodutos,
  });

  void toggleCompleteShop() {
    //Método para marcar compra como concluída ou não concluída
    http.patch('https://flutter-minhascompras.firebaseio.com/shops/$id.json',
        body: json.encode({
          'name': nome,
          'date': data.toString(),
          'iscompleted': !iscompleted
        }));
    iscompleted = !iscompleted;
    notifyListeners();
  }
}
