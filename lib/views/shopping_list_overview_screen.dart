import 'package:flutter/material.dart';
import 'package:minhas_compras/widgets/shop_item.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:provider/provider.dart';

class ShoppingListOverviewScreen extends StatelessWidget {
  final List<Compra> listadecompras;
  final Function delCompra;
  final Function showModalForm;

  ShoppingListOverviewScreen(
      {@required this.listadecompras,
      @required this.delCompra,
      @required this.showModalForm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ...listadecompras.map((compra) {
            return ChangeNotifierProvider.value(
              value: compra,
              child: ShopItem(),
            );

            // if (compra.iscompleted == false) {
            //   return
            //  } else {
            //    return Container();
//}
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
