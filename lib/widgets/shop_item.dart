import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:minhas_compras/models/compra.dart';

import 'package:minhas_compras/utils/routes.dart';

import 'package:minhas_compras/views/produtos.dart';

import 'package:minhas_compras/providers/shops_provider.dart';
import 'package:provider/provider.dart';

class ShopItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final compra = Provider.of<Compra>(context);
    final Function delCompra = Provider.of<ShopProvider>(context).delCompra;
    //final Function completeCompra =
    // Provider.of<ShopProvider>(context).completeCompra;
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
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(
                            context,
                            AppRoutes
                                .initial_screen); //Problema de a tela de compras não ser atualizada com a alteração do status de completo de uma compra mudar parcialmente resolvido
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
            ),
          ),
        ));
  }
}
