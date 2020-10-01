import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/utils/constants.dart';

class ImportShopItem extends StatefulWidget {
  final String userId;
  final token;
  final Compra oldShop;
  final Compra newShop;
  ImportShopItem(this.oldShop, this.newShop, this.token, this.userId);

  @override
  _ImportShopItemState createState() => _ImportShopItemState();
}

class _ImportShopItemState extends State<ImportShopItem> {
  final String _baseShopUrl = '${Constants.BASE_API_URL}/shops';

  Future<void> addProduto(
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

    Response response = await http.patch(
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
    List products = widget.oldShop.listadeprodutos;

    return Card(
      color: Colors.white,
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
          subtitle: Text((DateFormat('dd/MM/y').format(widget.oldShop.data))),
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.archive,
                        color: Theme.of(context).accentColor),
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Importar Todos os Produtos"),
                            content: Text(
                                "Tem certeza que deseja baixar todos os produtos dessa compra?"),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancelar")),
                              FlatButton(
                                child: Text("OK"),
                                onPressed: () {
                                  for (var p in products) {
                                    addProduto(p.nome, p.quantidade,
                                        p.categoria, p.iscomplete);
                                    //TODO: Adicionar esses produtos na currentShop

                                  }

                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        })
                    /*Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider.value(
                                  value: widget.compra,
                                  child: ShopEditFormScreen(),
                                ))) */
                    ),
                IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    color: Theme.of(context).errorColor,
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Apagar Compra"),
                            content: Text(
                                "Tem certeza que deseja APAGAR essa compra?"),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancelar")),
                              FlatButton(onPressed: null, child: Text("OK"))
                            ],
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
