import 'package:flutter/material.dart';

import 'package:minhas_compras/providers/shops_provider.dart';
import 'package:minhas_compras/widgets/shop_item.dart';
import 'package:provider/provider.dart';

class ComprasConcluidas extends StatefulWidget {
  @override
  _ComprasConcluidasState createState() => _ComprasConcluidasState();
}

class _ComprasConcluidasState extends State<ComprasConcluidas> {
  @override
  Widget build(BuildContext context) {
    final ShopProvider compra = Provider.of<ShopProvider>(context);
    final shoplistcomplete = compra.completeShops;
    return ListView(
      children: <Widget>[
        ...shoplistcomplete.map((compra) {
          return ChangeNotifierProvider.value(
            value: compra,
            child: ShopItem(),
          );
        }),
        const SizedBox(
          height: 70,
        )
      ],
    );
  }
}
