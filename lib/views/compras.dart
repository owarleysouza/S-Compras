import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/views/addCompra.dart';
import 'package:minhas_compras/views/compraTemplate.dart';

class Compras extends StatefulWidget {
  @override
  _ComprasState createState() => _ComprasState();
}

class _ComprasState extends State<Compras> {
  final List<Compra> listadecomprasfeitas = [
    Compra(
        id: Random().nextDouble().toString(),
        nome: "Compra de Julho",
        data: DateTime.now(),
        listadeprodutos: [
          Produto(
              id: Random().nextDouble().toString(),
              nome: "Fuba",
              quantidade: "2",
              categoria: "Grosso"),
          Produto(
              id: Random().nextDouble().toString(),
              nome: "Sal",
              quantidade: "Padrão",
              categoria: "Grosso"),
          Produto(
              id: Random().nextDouble().toString(),
              nome: "Desinfetante",
              quantidade: "3",
              categoria: "LeH"),
          Produto(
              id: Random().nextDouble().toString(),
              nome: "Desodorante",
              quantidade: "1",
              categoria: "LeH"),
          Produto(
              id: Random().nextDouble().toString(),
              nome: "Sabonete",
              quantidade: "Padrão",
              categoria: "LeH"),
          Produto(
              id: Random().nextDouble().toString(),
              nome: "Fio Dental",
              quantidade: "2",
              categoria: "LeH"),
          Produto(
              id: Random().nextDouble().toString(),
              nome: "Lâmina de Barbear",
              quantidade: "Padrão",
              categoria: "LeH"),
          Produto(
              id: Random().nextDouble().toString(),
              nome: "Peixe",
              quantidade: "3",
              categoria: "Frios"),
          Produto(
              id: Random().nextDouble().toString(),
              nome: "Salsicha",
              quantidade: "1",
              categoria: "Frios"),
        ]),
    Compra(
        id: Random().nextDouble().toString(),
        nome: "Compra de Agosto",
        data: DateTime.now(),
        listadeprodutos: [
          Produto(
              id: Random().nextDouble().toString(),
              nome: "Açúcar",
              quantidade: "2",
              categoria: "Grosso"),
          Produto(
              id: Random().nextDouble().toString(),
              nome: "Sal",
              quantidade: "Padrão",
              categoria: "Grosso"),
          Produto(
              id: Random().nextDouble().toString(),
              nome: "Sabonete",
              quantidade: "Padrão",
              categoria: "LeH"),
          Produto(
              id: Random().nextDouble().toString(),
              nome: "Fio Dental",
              quantidade: "2",
              categoria: "LeH"),
          Produto(
              id: Random().nextDouble().toString(),
              nome: "Lâmina de Barbear",
              quantidade: "Padrão",
              categoria: "LeH"),
          Produto(
              id: Random().nextDouble().toString(),
              nome: "Peixe",
              quantidade: "3",
              categoria: "Frios"),
          Produto(
              id: Random().nextDouble().toString(),
              nome: "Salsicha",
              quantidade: "1",
              categoria: "Frios"),
        ]),
    Compra(
        id: Random().nextDouble().toString(),
        nome: "Compra de Agosto",
        data: DateTime.now(),
        listadeprodutos: []),
    Compra(
        id: Random().nextDouble().toString(),
        nome: "Compra de Agosto",
        data: DateTime.now(),
        listadeprodutos: []),
    Compra(
        id: Random().nextDouble().toString(),
        nome: "Compra de Agosto",
        data: DateTime.now(),
        listadeprodutos: []),
    Compra(
        id: Random().nextDouble().toString(),
        nome: "Compra de Agosto",
        data: DateTime.now(),
        listadeprodutos: []),
  ];

  _addCompra(String novonome, DateTime datadacompra, List<Produto> produtos) {
    final novacompra = Compra(
        id: Random().nextDouble().toString(),
        nome: novonome,
        data: datadacompra,
        listadeprodutos: produtos);
    setState(() {
      listadecomprasfeitas.add(novacompra);
    });

    Navigator.of(context).pop();
  }

  _delCompra(String id) {
    setState(() {
      listadecomprasfeitas.removeWhere((compra) => compra.id == id);
    });
  }

  _openAddShopFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddCompra(submeter: _addCompra);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  'User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Perfil'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configurações'),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Compras Feitas"),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            ...listadecomprasfeitas.map((compra) => CompraTemplate(
                  compra: compra,
                  delCompra: _delCompra,
                )),
            SizedBox(
              height: 70,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add_box),
            onPressed: () {
              _openAddShopFormModal(context);
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
