import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';

import 'package:minhas_compras/utils/constants.dart';

// ignore: must_be_immutable
class ImportShopItem extends StatefulWidget {
  Compra oldShop;
  Compra newShop;
  String token;
  String userId;
  ImportShopItem({this.oldShop, this.newShop, this.token, this.userId});
  @override
  _ImportShopItemState createState() => _ImportShopItemState();
}

class _ImportShopItemState extends State<ImportShopItem> {
  final String _baseShopUrl = '${Constants.BASE_API_URL}/shops';

  Future<void> _addProduto(
      String nome, int quantidade, String categoria, bool iscomplete) async {
    final shopId = widget.newShop.id;
    List products = widget.newShop.listadeprodutos;

    final novoProduto = Produto(
        id: Random().nextDouble().toString(),
        nome: nome,
        quantidade: quantidade,
        categoria: categoria,
        iscomplete: iscomplete);

    setState(() {
      products.add(novoProduto);
    });

    await http.patch(
        '$_baseShopUrl/${widget.userId}/$shopId.json?auth=${widget.token}',
        body: json.encode({
          'name': widget.newShop.nome,
          'date': widget.newShop.data.toString(),
          'iscompleted': widget.newShop.iscompleted,
          'products': products
              .map((product) => {
                    'id': product.id,
                    'nome': product.nome,
                    'quantidade': product.quantidade,
                    'categoria': product.categoria,
                    'iscomplete': product.iscomplete
                  })
              .toList()
        }));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //TODO: Fazer com que cada compra mostre os seus produtos, para poderem ser selecionados, usar import product item acho que é uma boa
          //Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => Produtos()));
        },
        child: Card(
          color: widget.oldShop.iscompleted == true
              ? Colors.lightGreen[300]
              : Colors.white,
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
            child: ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).primaryColor,
                size: 40,
              ),
              title: Text(widget.oldShop.nome),
              subtitle:
                  Text((DateFormat('dd/MM/y').format(widget.oldShop.data))),
              trailing: IconButton(
                icon: Icon(Icons.cloud_download),
                onPressed: () {
                  //TODO: Corrigir erro que está dando logo depois de importar uma compra.
                  for (var product in widget.oldShop.listadeprodutos) {
                    if (widget.oldShop.listadeprodutos != null) {
                      _addProduto(product.nome, product.quantidade,
                          product.categoria, product.iscomplete);
                    }
                  }
                },
              ),
            ),
          ),
        ));
  }
}
