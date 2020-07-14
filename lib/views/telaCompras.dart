import 'package:flutter/material.dart';
import 'package:minhas_compras/components/compraTemplate.dart';
import 'package:minhas_compras/models/compra.dart';

class TelaCompras extends StatelessWidget {
  final List<Compra> listadecompras;
  final Function delCompra;
  final Function completeCompra;
  final Function showModalForm;

  TelaCompras(
      {@required this.listadecompras,
      @required this.delCompra,
      @required this.completeCompra,
      @required this.showModalForm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ...listadecompras.map((compra) {
            if (compra.iscompleted == false) {
              return CompraTemplate(
                compra: compra,
                delCompra: delCompra,
                completeCompra: completeCompra,
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
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_box),
          onPressed: () {
            showModalForm(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
