import 'package:flutter/foundation.dart';

class Produto with ChangeNotifier {
  String id;
  String nome;
  String quantidade;
  String categoria;
  bool iscomplete;

  Produto(
      {@required this.id,
      @required this.nome,
      @required this.quantidade,
      @required this.categoria,
      @required this.iscomplete});

  void toggleCompleteProduct() {
    iscomplete = !iscomplete;
    notifyListeners();
  }
}
