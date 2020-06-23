import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/views/produtos.dart';

class CompraTemplate extends StatelessWidget {
  final Compra compra;
  final Function delCompra;

  CompraTemplate({
    @required this.compra,
    @required this.delCompra,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Produtos(
                    compra: compra,
                  )));
        },
        child: Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(
                  backgroundColor: Color(0xFF14213D),
                  radius: 30,
                  child: Text(compra.listadeprodutos.length.toString()),
                ),
              ),
              title: Text(compra.nome),
              subtitle: Text((DateFormat('dd/MM/y').format(compra.data))),
              trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () => delCompra(compra.id)),
            ),
          ),
        ));
  }
}
