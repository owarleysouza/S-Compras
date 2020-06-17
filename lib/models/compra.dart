import 'package:flutter/foundation.dart';
import 'package:minhas_compras/models/produto.dart';

class Compra {
  String nome;
  DateTime data;
  List<Produto> listadeprodutos;

  Compra(
      {@required this.nome,
      this.data,
      this.listadeprodutos =
          const []}); //Tá dando erro porque não eh possivel add um novo produto a uma lista que tem essa lista de produtos vazia e constante. Resolver isso
}
