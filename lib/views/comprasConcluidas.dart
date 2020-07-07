import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/components/compraTemplate.dart';

class ComprasConcluidas extends StatefulWidget {
  final List<Compra> compras;
  final Function delCompra;

  ComprasConcluidas({@required this.compras, @required this.delCompra});

  @override
  _ComprasConcluidasState createState() => _ComprasConcluidasState();
}

class _ComprasConcluidasState extends State<ComprasConcluidas> {
  _completeCompra(String id, bool iscomplete) {
    for (Compra compra in widget.compras) {
      if (compra.id == id) {
        setState(() {
          compra.iscompleted = iscomplete;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compras Realizadas"),
      ),
      body: ListView(
        children: <Widget>[
          ...widget.compras.map((compra) {
            if (compra.iscompleted == true) {
              return CompraTemplate(
                compra: compra,
                delCompra: widget.delCompra,
                completeCompra: _completeCompra,
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
    );
  }
}
