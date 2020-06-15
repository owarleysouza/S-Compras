import 'package:minhas_compras/models/produto.dart';

class ListadeCompra {
  String nome;
  DateTime data;
  List<Produto> listadeprodutos;

  ListadeCompra({this.nome, this.data, this.listadeprodutos});
}
