import 'package:flutter/foundation.dart';
import 'package:minhas_compras/models/produto.dart';

class Compra with ChangeNotifier {
  final String id;
  final String nome;
  final DateTime data;
  bool iscompleted;
  List<Produto> listadeprodutos;

  Compra({
    @required this.id,
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
