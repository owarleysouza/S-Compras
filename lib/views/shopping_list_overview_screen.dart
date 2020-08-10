import 'package:flutter/material.dart';
import 'package:minhas_compras/widgets/shop_item.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:provider/provider.dart';

class ShoppingListOverviewScreen extends StatelessWidget {
  final List<Compra> shoplistnotcomplete;
  final Function delCompra;
  final Function showModalForm;

  ShoppingListOverviewScreen(
      {@required this.shoplistnotcomplete,
      @required this.delCompra,
      @required this.showModalForm});

  @override
  Widget build(BuildContext context) {
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
