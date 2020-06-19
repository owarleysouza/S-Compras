import 'package:flutter/foundation.dart';
import 'package:minhas_compras/models/produto.dart';

class Compra {
  String id;
  String nome;
  DateTime data;
  List<Produto> listadeprodutos;

  Compra({
    @required this.id,
    @required this.nome,
    @required this.data,
    @required this.listadeprodutos,
  });
}
