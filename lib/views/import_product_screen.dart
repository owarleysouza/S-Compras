import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/providers/shops_provider.dart';
import 'package:minhas_compras/widgets/import_shop_item.dart';
import 'package:provider/provider.dart';

class ImportProductsScreen extends StatefulWidget {
  final Compra newShop;

  ImportProductsScreen({@required this.newShop});
  @override
  _ImportProductsScreenState createState() => _ImportProductsScreenState();
}

class _ImportProductsScreenState extends State<ImportProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final token = Provider.of<ShopProvider>(context).token;
    final userId = Provider.of<ShopProvider>(context).userId;
    List<Compra> shops = Provider.of<ShopProvider>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Importar para ${widget.newShop.nome}",
          style: TextStyle(fontSize: 12),
        ),
      ),
      body: ListView(
        children: [
          ...shops.map((shop) => ImportShopItem(
                oldShop: shop,
                newShop: widget.newShop,
                token: token,
                userId: userId,
              ))
        ],
      ),
    );
  }
}
