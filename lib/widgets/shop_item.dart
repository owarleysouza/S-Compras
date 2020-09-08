import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:minhas_compras/models/compra.dart';

import 'package:minhas_compras/utils/routes.dart';
import 'package:minhas_compras/views/complete_shops_screen.dart';
import 'package:minhas_compras/views/not_complete_shops_screen.dart';

import 'package:minhas_compras/views/products_list_overview_screen.dart';

import 'package:minhas_compras/providers/shops_provider.dart';
import 'package:minhas_compras/views/shop_edit_form_screen.dart';
import 'package:provider/provider.dart';

class ShopItem extends StatefulWidget {
  @override
  _ShopItemState createState() => _ShopItemState();
}

class _ShopItemState extends State<ShopItem> {
  Future<void> _refreshShops(BuildContext context) {
    return Provider.of<ShopProvider>(context, listen: false).loadShops();
  }

  @override
  Widget build(BuildContext context) {
    final compra = Provider.of<Compra>(context);
    final Function delCompra = Provider.of<ShopProvider>(context).delCompra;

    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Produtos(
                    compra: compra,
                  )));
        },
        onDoubleTap: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(compra.iscompleted == true
                    ? "Desconcluir Compra"
                    : "Concluir Compra"),
                content: Text(compra.iscompleted == true
                    ? "Tem certeza que deseja DESMARCAR essa compra como concluída?"
                    : "Tem certeza que deseja MARCAR essa compra como concluída?"),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancelar")),
                  FlatButton(
                      onPressed: () {
                        compra.toggleCompleteShop();
                        _refreshShops(context);
                        Navigator.pop(context);
                      },
                      child: Text("OK"))
                ],
              );
            }),
        child: Card(
          color: compra.iscompleted == true
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
              title: Text(compra.nome),
              subtitle: Text((DateFormat('dd/MM/y').format(compra.data))),
              trailing: Container(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.edit,
                            color: Theme.of(context).accentColor),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChangeNotifierProvider.value(
                                      value: compra,
                                      child: ShopEditFormScreen(),
                                    )))),
                    IconButton(
                        icon: const Icon(Icons.delete),
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
                                  FlatButton(
                                      onPressed: () {
                                        delCompra(compra.id);
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"))
                                ],
                              );
                            })),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
