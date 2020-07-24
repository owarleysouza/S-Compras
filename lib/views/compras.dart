import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:minhas_compras/components/mainDrawer.dart';
import 'package:minhas_compras/data/dummy_data.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/components/addCompra.dart';
import 'package:minhas_compras/views/comprasConcluidas.dart';
import 'package:minhas_compras/views/telaCompras.dart';

class Compras extends StatefulWidget {
  final List<Compra> listadeCompras = LISTADECOMPRAS;

  @override
  _ComprasState createState() => _ComprasState();
}

class _ComprasState extends State<Compras> {
  _addCompra(String novonome, DateTime datadacompra, List<Produto> produtos) {
    const url = 'https://flutter-minhascompras.firebaseio.com/compras.json';

    http
        .post(
      url,
      body: json.encode({
        'nome': novonome,
        'data': datadacompra.toString(),
        'iscompeted': false,
        'listadeprodutos': [
          Produto(
              id: Random().nextDouble().toString(),
              nome: "PTeste",
              quantidade: "0",
              categoria: "Grosso",
              iscomplete: false)
        ],
      }),
    )
        .then((response) {
      final novacompra = Compra(
          id: json.decode(response.body)['name'],
          nome: novonome,
          data: datadacompra,
          iscompleted: false,
          listadeprodutos: produtos);
      setState(() {
        widget.listadeCompras.add(novacompra);
      });

      Navigator.of(context).pop();
    });
  }

  _delCompra(String id) {
    setState(() {
      widget.listadeCompras.removeWhere((compra) => compra.id == id);
    });
  }

  _openAddShopFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddCompra(submeter: _addCompra);
        });
  }

  _completeCompra(String id, bool iscomplete) {
    for (Compra compra in widget.listadeCompras) {
      if (compra.id == id) {
        setState(() {
          compra.iscompleted = iscomplete;
        });
      }
    }
  }

  int _selectedScreenIndex = 0;
  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      TelaCompras(
        listadecompras: widget.listadeCompras,
        delCompra: _delCompra,
        completeCompra: _completeCompra,
        showModalForm: _openAddShopFormModal,
      ),
      ComprasConcluidas(compras: widget.listadeCompras, delCompra: _delCompra)
    ];

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: const Text("Compras"),
        centerTitle: true,
      ),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedScreenIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                title: Text("Compras Atuais")),
            BottomNavigationBarItem(
                icon: Icon(Icons.check_circle),
                title: Text("Compras Realizadas"))
          ]),
    );
  }
}
