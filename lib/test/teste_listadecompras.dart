import 'dart:math';

import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';

main() {
  var compras = Compra(
      id: Random().nextDouble().toString(),
      nome: "Compra de Julho",
      data: DateTime.now(),
      listadeprodutos: [
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Açúcar",
            quantidade: "2x",
            categoria: "Grosso"),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Sal",
            quantidade: "Padrão",
            categoria: "Grosso"),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Desinfetante",
            quantidade: "3x",
            categoria: "LeH"),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Desodorante",
            quantidade: "1x",
            categoria: "LeH"),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Sabonete",
            quantidade: "Padrão",
            categoria: "LeH"),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Fio Dental",
            quantidade: "2x",
            categoria: "LeH"),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Lâmina de Barbear",
            quantidade: "Padrão",
            categoria: "LeH"),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Peixe",
            quantidade: "3x",
            categoria: "Frios"),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Salsicha",
            quantidade: "1x",
            categoria: "Frios"),
      ]);

  print(compras.nome);
  print(compras.listadeprodutos[3].nome);
}
