import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/providers/shops_provider.dart';
import 'package:minhas_compras/widgets/import_shop_item.dart';
import 'package:provider/provider.dart';

class ImportShop extends StatelessWidget {
  final Compra currentShop;
  ImportShop(this.currentShop);
  @override
  Widget build(BuildContext context) {
    List compras = Provider.of<ShopProvider>(context).items;
    return Card(
      child: ListView(
        children: [
          ...compras.map((compra) => ImportShopItem(compra, currentShop))
        ],
      ),
    );
  }
}
