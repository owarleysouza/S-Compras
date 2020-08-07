import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/widgets/shop_item.dart';
import 'package:provider/provider.dart';

class ComprasConcluidas extends StatefulWidget {
  final List<Compra> listadecompras;
  final Function delCompra;

  ComprasConcluidas({@required this.listadecompras, @required this.delCompra});

  @override
  _ComprasConcluidasState createState() => _ComprasConcluidasState();
}

class _ComprasConcluidasState extends State<ComprasConcluidas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ...widget.listadecompras.map((compra) {
            return ChangeNotifierProvider.value(
              value: compra,
              child: ShopItem(),
            );

            // if (compra.iscompleted == true) {
            //   return
            // } else {
            //   return Container();
            //  }
          }),
          const SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}
