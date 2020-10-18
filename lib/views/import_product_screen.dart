import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/providers/shops_provider.dart';
import 'package:minhas_compras/widgets/import_shop_item.dart';
import 'package:provider/provider.dart';

class ImportProductsScreen extends StatefulWidget {
  final Compra compra;

  ImportProductsScreen({@required this.compra});
  @override
  _ImportProductsScreenState createState() => _ImportProductsScreenState();
}

class _ImportProductsScreenState extends State<ImportProductsScreen> {
  @override
  Widget build(BuildContext context) {
    List<Compra> shops = Provider.of<ShopProvider>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: Text("Importar Compra"),
      ),
      body: ListView(
        children: [
          ...shops.map((shop) => ImportShopItem(
                compra: shop,
              ))
        ],
      ),
    );
  }
}
