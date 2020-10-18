import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minhas_compras/models/compra.dart';

// ignore: must_be_immutable
class ImportShopItem extends StatefulWidget {
  Compra compra;
  ImportShopItem({this.compra});
  @override
  _ImportShopItemState createState() => _ImportShopItemState();
}

class _ImportShopItemState extends State<ImportShopItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //TODO: Fazer com que cada compra mostre os seus produtos, para poderem ser selecionados, usar import product item acho que é uma boa
          //Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => Produtos()));
        },
        child: Card(
          color: widget.compra.iscompleted == true
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
              title: Text(widget.compra.nome),
              subtitle:
                  Text((DateFormat('dd/MM/y').format(widget.compra.data))),
              trailing: IconButton(
                  icon: Icon(Icons.cloud_download),
                  onPressed:
                      null //TODO: Fazer com que todos os produtos dessa compra sejam importados para a compra atual, o que equivale a importar uma compra toda
                  ),
            ),
          ),
        ));
  }
}
