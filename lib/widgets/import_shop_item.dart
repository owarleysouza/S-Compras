import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/views/products_list_overview_screen.dart';

class ImportShopItem extends StatefulWidget {
  final Compra compra;
  final Compra currentShop;
  ImportShopItem(this.compra, this.currentShop);

  @override
  _ImportShopItemState createState() => _ImportShopItemState();
}

class _ImportShopItemState extends State<ImportShopItem> {
  @override
  Widget build(BuildContext context) {
    List products = widget.compra.listadeprodutos;

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
          title: Text(widget.compra.nome),
          subtitle: Text((DateFormat('dd/MM/y').format(widget.compra.data))),
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
