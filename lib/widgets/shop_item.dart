import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/views/produtos.dart';

class ShopItem extends StatelessWidget {
  final Compra compra;
  final Function delCompra;
  final Function completeCompra;

  ShopItem(
      {@required this.compra,
      @required this.delCompra,
      @required this.completeCompra});

  @override
  Widget build(BuildContext context) {
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
                title: Text("Concluir Compra"),
                content: Text(
                    "Tem certeza que deseja marcar essa compra como concluída?"),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancelar")),
                  FlatButton(
                      onPressed: () {
                        completeCompra(compra.id, false);
                        Navigator.pop(context);
                      },
                      child: Text("Desmarcar Compra")),
                  FlatButton(
                      onPressed: () {
                        completeCompra(compra.id, true);
                        Navigator.pop(context);
                      },
                      child: Text("OK"))
                ],
              );
            }),
        child: Card(
          color: compra.iscompleted == true ? Colors.green[200] : Colors.white,
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(
                  backgroundColor: const Color(0xFF14213D),
                  radius: 30,
                  child: Text(compra.listadeprodutos.length.toString()),
                ),
              ),
              title: Text(compra.nome),
              subtitle: Text((DateFormat('dd/MM/y').format(compra.data))),
              trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () => delCompra(compra.id)),
            ),
          ),
        ));
  }
}
