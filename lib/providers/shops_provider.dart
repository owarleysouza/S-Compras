import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:minhas_compras/data/dummy_data.dart';
import 'package:minhas_compras/models/compra.dart';

import 'package:minhas_compras/widgets/add_shop.dart';

class ShopProvider with ChangeNotifier {
  final String _url = 'https://flutter-minhascompras.firebaseio.com/shops.json';

  List<Compra> _items = [];

  List<Compra> get items => [
        ..._items
      ]; //Retornando uma copia dos items para não se ter acesso direto a referencia da lista

  List<Compra> get completeShops {
    return _items.where((shop) => shop.iscompleted == true).toList();
  }

  List<Compra> get notCompleteShops {
    return _items.where((shop) => shop.iscompleted == false).toList();
  }

  Future<void> loadShops() async {
    final response = await http.get(_url);
    Map<String, dynamic> data = json.decode(response.body);
    data.forEach((shopId, shopData) {
      _items.add(Compra(
          id: shopId,
          nome: shopData['name'],
          data: DateTime.parse(shopData['date']),
          iscompleted: shopData['iscompleted'],
          listadeprodutos: []));
    });
    notifyListeners();
  }

  Future<void> addShop(Compra newShop) async {
    //Usando async e await para 'trasnformar' o método assíncrono de forma mais síncrona

    final response = await http.post(_url,
        body: json.encode({
          'name': newShop.nome,
          'date': newShop.data.toString(),
          'iscompleted': newShop.iscompleted,
          'produtos': newShop.listadeprodutos
        }));

    _items.add(Compra(
        id: json.decode(response.body)['name'],
        nome: newShop.nome,
        data: newShop.data,
        iscompleted: newShop.iscompleted,
        listadeprodutos: newShop.listadeprodutos));

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
