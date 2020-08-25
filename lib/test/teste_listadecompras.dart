import 'dart:math';

import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';

main() {
  var compras = Compra(
      id: Random().nextDouble().toString(),
      nome: "Compra de Julho",
      data: DateTime.now(),
      iscompleted: false,
      listadeprodutos: [
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Açúcar",
            quantidade: 2,
            categoria: "Grosso",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Sal",
            quantidade: 0,
            categoria: "Grosso",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Desinfetante",
            quantidade: 3,
            categoria: "LeH",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Desodorante",
            quantidade: 1,
            categoria: "LeH",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Sabonete",
            quantidade: 0,
            categoria: "LeH",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Fio Dental",
            quantidade: 2,
            categoria: "LeH",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Lâmina de Barbear",
            quantidade: 0,
            categoria: "LeH",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Peixe",
            quantidade: 3,
            categoria: "Frios",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Salsicha",
            quantidade: 1,
            categoria: "Frios",
            iscomplete: false),
      ]);

  print(compras.nome);
  print(compras.listadeprodutos[3].nome);
}
