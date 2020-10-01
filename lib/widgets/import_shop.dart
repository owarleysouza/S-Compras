import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/providers/shops_provider.dart';
import 'package:minhas_compras/widgets/import_shop_item.dart';
import 'package:provider/provider.dart';

class ImportShop extends StatelessWidget {
  final String userId;
  final token;
  final Compra newShop;
  ImportShop(this.newShop, this.token, this.userId);
  @override
  Widget build(BuildContext context) {
    List compras = Provider.of<ShopProvider>(context).items;
    return Card(
      child: ListView(
        children: [
          ...compras
              .map((oldShop) => ImportShopItem(oldShop, newShop, token, userId))
        ],
      ),
    );
  }
}
