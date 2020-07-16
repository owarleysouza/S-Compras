import 'dart:math';

import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';

final LISTADECOMPRAS = [
  Compra(
      id: Random().nextDouble().toString(),
      nome: "Compra de Julho",
      data: DateTime.now(),
      iscompleted: false,
      listadeprodutos: [
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Fuba",
            quantidade: "2",
            categoria: "Grosso",
            iscomplete: true),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Sal",
            quantidade: "Padrão",
            categoria: "Grosso",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Desinfetante",
            quantidade: "3",
            categoria: "LeH",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Desodorante",
            quantidade: "1",
            categoria: "LeH",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Sabonete",
            quantidade: "Padrão",
            categoria: "LeH",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Fio Dental",
            quantidade: "2",
            categoria: "LeH",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Lâmina de Barbear",
            quantidade: "Padrão",
            categoria: "LeH",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Peixe",
            quantidade: "3",
            categoria: "Frios",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Salsicha",
            quantidade: "1",
            categoria: "Frios",
            iscomplete: false),
      ]),
  Compra(
      id: Random().nextDouble().toString(),
      nome: "Compra de Agosto",
      data: DateTime.now(),
      iscompleted: false,
      listadeprodutos: [
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Açúcar",
            quantidade: "2",
            categoria: "Grosso",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Sal",
            quantidade: "Padrão",
            categoria: "Grosso",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Sabonete",
            quantidade: "Padrão",
            categoria: "LeH",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Fio Dental",
            quantidade: "2",
            categoria: "LeH",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Lâmina de Barbear",
            quantidade: "Padrão",
            categoria: "LeH",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Peixe",
            quantidade: "3",
            categoria: "Frios",
            iscomplete: false),
        Produto(
            id: Random().nextDouble().toString(),
            nome: "Salsicha",
            quantidade: "1",
            categoria: "Frios",
            iscomplete: false),
      ]),
  Compra(
      id: Random().nextDouble().toString(),
      nome: "Compra de Set",
      data: DateTime.now(),
      iscompleted: true,
      listadeprodutos: []),
];
