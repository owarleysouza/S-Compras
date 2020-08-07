import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/widgets/shop_item.dart';
import 'package:provider/provider.dart';

class ComprasConcluidas extends StatefulWidget {
  final List<Compra> compras;
  final Function delCompra;

  ComprasConcluidas({@required this.compras, @required this.delCompra});

  @override
  _ComprasConcluidasState createState() => _ComprasConcluidasState();
}

class _ComprasConcluidasState extends State<ComprasConcluidas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ...widget.compras.map((compra) {
            if (compra.iscompleted == true) {
              return ChangeNotifierProvider.value(
                value: compra,
                child: ShopItem(),
              );
            } else {
              return Container();
            }
          }),
          const SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}
