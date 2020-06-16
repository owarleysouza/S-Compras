import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/views/compraTemplate.dart';

class Compras extends StatefulWidget {
  @override
  _ComprasState createState() => _ComprasState();
}

class _ComprasState extends State<Compras> {
  final List<Compra> listadecomprasfeitas = [
    Compra(nome: "Compra de Julho", data: DateTime.now(), listadeprodutos: [
      Produto(nome: "Açúcar", quantidade: "2x", categoria: "Grosso"),
      Produto(nome: "Sal", quantidade: "Padrão", categoria: "Grosso"),
      Produto(nome: "Desinfetante", quantidade: "3x", categoria: "LeH"),
      Produto(nome: "Desodorante", quantidade: "1x", categoria: "LeH"),
      Produto(nome: "Sabonete", quantidade: "Padrão", categoria: "LeH"),
      Produto(nome: "Fio Dental", quantidade: "2x", categoria: "LeH"),
      Produto(
          nome: "Lâmina de Barbear", quantidade: "Padrão", categoria: "LeH"),
      Produto(nome: "Peixe", quantidade: "3x", categoria: "Frios"),
      Produto(nome: "Salsicha", quantidade: "1x", categoria: "Frios"),
    ]),
    Compra(nome: "Compra de Agosto", data: DateTime.now(), listadeprodutos: [
      Produto(nome: "Açúcar", quantidade: "2x", categoria: "Grosso"),
      Produto(nome: "Sal", quantidade: "Padrão", categoria: "Grosso"),
      Produto(nome: "Sabonete", quantidade: "Padrão", categoria: "LeH"),
      Produto(nome: "Fio Dental", quantidade: "2x", categoria: "LeH"),
      Produto(
          nome: "Lâmina de Barbear", quantidade: "Padrão", categoria: "LeH"),
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
          ...listadecomprasfeitas.map((compra) => CompraTemplate(
              nome: compra.nome,
              data: compra.data,
              quantidadeitens: compra.listadeprodutos.length)),
          RaisedButton(
            onPressed: () => Navigator.of(context).pushNamed('produtos'),
            child: Text("Produtos"),
          )
        ],
      ),
    );
  }
}
