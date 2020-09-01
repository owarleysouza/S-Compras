import 'package:flutter/foundation.dart';

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
    iscompleted = !iscompleted;
    notifyListeners();
  }
}
