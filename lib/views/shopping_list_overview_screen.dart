import 'package:flutter/material.dart';
import 'package:minhas_compras/providers/shops_provider.dart';
import 'package:minhas_compras/widgets/shop_item.dart';
import 'package:provider/provider.dart';

class ShoppingListOverviewScreen extends StatefulWidget {
  @override
  _ShoppingListOverviewScreenState createState() =>
      _ShoppingListOverviewScreenState();
}

class _ShoppingListOverviewScreenState
    extends State<ShoppingListOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    final ShopProvider compra = Provider.of<ShopProvider>(context);
    final showModalForm = compra.openAddShopFormModal;
    final shoplistnotcomplete = compra.notCompleteShops;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ...shoplistnotcomplete.map((compra) {
            return ChangeNotifierProvider.value(
              value: compra,
              child: ShopItem(),
            );
          }),
          const SizedBox(
            height: 70,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_box),
          onPressed: () {
            showModalForm(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
