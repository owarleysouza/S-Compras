import 'package:flutter/foundation.dart';
import 'package:minhas_compras/models/produto.dart';

class Compra {
  String nome;
  DateTime data;
  List<Produto> listadeprodutos;

  Compra({@required this.nome, @required this.listadeprodutos, this.data});
}
