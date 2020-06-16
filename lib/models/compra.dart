import 'package:minhas_compras/models/produto.dart';

class Compra {
  String nome;
  DateTime data;
  List<Produto> listadeprodutos;

  Compra({this.nome, this.data, this.listadeprodutos});
}
