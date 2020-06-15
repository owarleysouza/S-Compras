import 'package:flutter/material.dart';
import 'package:minhas_compras/models/listadecompra.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/views/listasdeComprasTemplate.dart';

class ListasdeCompras extends StatefulWidget {
  @override
  _ListasdeComprasState createState() => _ListasdeComprasState();
}

class _ListasdeComprasState extends State<ListasdeCompras> {
  final List<ListadeCompra> listadelistasdecompras = [
    ListadeCompra(
        nome: "Compra de Julho",
        data: DateTime.now(),
        listadeprodutos: [
          Produto(nome: "Açúcar", quantidade: "2x", categoria: "Grosso"),
          Produto(nome: "Sal", quantidade: "Padrão", categoria: "Grosso"),
          Produto(nome: "Desinfetante", quantidade: "3x", categoria: "LeH"),
          Produto(nome: "Desodorante", quantidade: "1x", categoria: "LeH"),
          Produto(nome: "Sabonete", quantidade: "Padrão", categoria: "LeH"),
          Produto(nome: "Fio Dental", quantidade: "2x", categoria: "LeH"),
          Produto(
              nome: "Lâmina de Barbear",
              quantidade: "Padrão",
              categoria: "LeH"),
          Produto(nome: "Peixe", quantidade: "3x", categoria: "Frios"),
          Produto(nome: "Salsicha", quantidade: "1x", categoria: "Frios"),
        ]),
    ListadeCompra(
        nome: "Compra de Agosto",
        data: DateTime.now(),
        listadeprodutos: [
          Produto(nome: "Açúcar", quantidade: "2x", categoria: "Grosso"),
          Produto(nome: "Sal", quantidade: "Padrão", categoria: "Grosso"),
          Produto(nome: "Sabonete", quantidade: "Padrão", categoria: "LeH"),
          Produto(nome: "Fio Dental", quantidade: "2x", categoria: "LeH"),
          Produto(
              nome: "Lâmina de Barbear",
              quantidade: "Padrão",
              categoria: "LeH"),
          Produto(nome: "Peixe", quantidade: "3x", categoria: "Frios"),
          Produto(nome: "Salsicha", quantidade: "1x", categoria: "Frios"),
        ])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compras Feitas"),
      ),
      body: ListView(
        children: <Widget>[
          ...listadelistasdecompras.map((listadecompra) => ListaComprasTemplate(
              nome: listadecompra.nome,
              data: listadecompra.data,
              quantidadeitens: listadecompra.listadeprodutos.length))
        ],
      ),
    );
  }
}
