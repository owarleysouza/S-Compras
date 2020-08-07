import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minhas_compras/data/dummy_data.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/widgets/addCompra.dart';

class ShopProvider with ChangeNotifier {
  List<Compra> _items = shopList;

  List<Compra> get items => [
        ..._items
      ]; //Retornando uma copia dos items para não se ter acesso direto a referencia da lista

  void addShop(Compra shop) {
    _items.add(shop);
    notifyListeners();
  }

  addCompra(String novonome, DateTime datadacompra, List<Produto> produtos) {
    final novacompra = Compra(
        id: Random().nextDouble().toString(),
        nome: novonome,
        data: datadacompra,
        iscompleted: false,
        listadeprodutos: produtos);
    /*setState(() {
      _items.add(novacompra);
    });*/

    //Navigator.of(context).pop();
  }

  delCompra(String id) {
    //setState(() {
    //   _items.removeWhere((compra) => compra.id == id);
    // });
  }

  openAddShopFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddCompra(submeter: addCompra);
        });
  }
}
