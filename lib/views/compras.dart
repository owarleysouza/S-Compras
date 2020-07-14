import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/components/addCompra.dart';
import 'package:minhas_compras/views/comprasConcluidas.dart';
import 'package:minhas_compras/views/telaCompras.dart';

class Compras extends StatefulWidget {
  @override
  _ComprasState createState() => _ComprasState();
}

class _ComprasState extends State<Compras> {
  final List<Compra> listadecompras = [
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

  _addCompra(String novonome, DateTime datadacompra, List<Produto> produtos) {
    final novacompra = Compra(
        id: Random().nextDouble().toString(),
        nome: novonome,
        data: datadacompra,
        iscompleted: false,
        listadeprodutos: produtos);
    setState(() {
      listadecompras.add(novacompra);
    });

    Navigator.of(context).pop();
  }

  _delCompra(String id) {
    setState(() {
      listadecompras.removeWhere((compra) => compra.id == id);
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
    for (Compra compra in listadecompras) {
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
        listadecompras: listadecompras,
        delCompra: _delCompra,
        completeCompra: _completeCompra,
        showModalForm: _openAddShopFormModal,
      ),
      ComprasConcluidas(compras: listadecompras, delCompra: _delCompra)
    ];

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
              leading: const Icon(Icons.add_to_home_screen),
              title: const Text("Compartilhar Compra"),
            ),
            Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
            ),
          ],
        ),
      ),
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
