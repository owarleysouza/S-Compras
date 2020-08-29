import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minhas_compras/data/dummy_data.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/widgets/add_shop.dart';

class ShopProvider with ChangeNotifier {
  List<Compra> _items = shopList;

  List<Compra> get items => [
        ..._items
      ]; //Retornando uma copia dos items para não se ter acesso direto a referencia da lista

  List<Compra> get completeShops {
    return _items.where((shop) => shop.iscompleted == true).toList();
  }

  List<Compra> get notCompleteShops {
    return _items.where((shop) => shop.iscompleted == false).toList();
  }

  addShop(Compra compra) {
    _items.add(compra);
    notifyListeners();
  }

  editshop(String id, String nome, DateTime data) {
    for (Compra compra in _items) {
      if (compra.id == id) {
        compra.nome = nome;
        compra.data = data;
      }
    }
    notifyListeners();
  }

  delCompra(String id) {
    _items.removeWhere((compra) => compra.id == id);
    notifyListeners();
  }

  openAddShopFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddShop(
            addShop: addShop,
          );
        });
  }
}
