import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:minhas_compras/exceptions/http_exception.dart';
import 'package:minhas_compras/models/compra.dart';

import 'package:minhas_compras/widgets/add_shop.dart';

class ShopProvider with ChangeNotifier {
  final String _baseUrl = 'https://flutter-minhascompras.firebaseio.com/shops';

  List<Compra> _items = [];

  List<Compra> get items => [
        ..._items
      ]; //Retornando uma copia dos items para não se ter acesso direto a referencia da lista

  List<Compra> get completeShops {
    return items.where((shop) => shop.iscompleted == true).toList();
  }

  List<Compra> get notCompleteShops {
    return items.where((shop) => shop.iscompleted == false).toList();
  }

  Future<void> loadShops() async {
    final response = await http.get('$_baseUrl.json');
    Map<String, dynamic> data = json.decode(response.body);
    _items
        .clear(); //Limpa-se a lista de items, para que cada vez que a tela for iniciada e esse metodo for chamado, nao duplique a lista
    if (data != null) {
      data.forEach((shopId, shopData) {
        _items.add(Compra(
            id: shopId,
            nome: shopData['name'],
            data: DateTime.parse(shopData['date']),
            iscompleted: shopData['iscompleted'],
            listadeprodutos: []));
      });
    }
    notifyListeners();

    return Future.value();
  }

  Future<void> addShop(Compra newShop) async {
    //Usando async e await para 'trasnformar' o método assíncrono de forma mais síncrona

    final response = await http.post('$_baseUrl.json',
        body: json.encode({
          'name': newShop.nome,
          'date': newShop.data.toString(),
          'iscompleted': newShop.iscompleted,
          'products': newShop.listadeprodutos
        }));

    _items.add(Compra(
        id: json.decode(response.body)['name'],
        nome: newShop.nome,
        data: newShop.data,
        iscompleted: newShop.iscompleted,
        listadeprodutos: newShop.listadeprodutos));

    notifyListeners();
  }

  Future<void> editshop(String id, String nome, DateTime data) async {
    for (Compra compra in _items) {
      if (compra.id == id) {
        await http.patch('$_baseUrl/${compra.id}.json',
            body: json.encode({
              'name': nome,
              'date': data.toString(),
            }));

        compra.nome = nome;
        compra.data = data;
      }
    }
    notifyListeners();
  }

  Future<void> deleteShop(String id) async {
    final index = _items.indexWhere((shop) => shop.id == id);
    if (index >= 0) {
      final shop = _items[index];
      _items.remove(shop);
      notifyListeners();

      final response = await http.delete('$_baseUrl/$id.json');

      if (response.statusCode >= 400) {
        _items.insert(index, shop);
        notifyListeners();
        throw HttpException("Ocorreu um erro ao excluir a compra!");
      }
    }
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
