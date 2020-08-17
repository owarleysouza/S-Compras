import 'package:flutter/material.dart';
import 'package:minhas_compras/models/produto.dart';

class ProductFormScreen extends StatefulWidget {
  final Produto produto;
  final Function editproduto;
  ProductFormScreen({@required this.produto, @required this.editproduto});

  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _quantityFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    String categoriaValue = widget.produto.categoria;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Produto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
            child: ListView(
          children: [
            TextFormField(
                decoration: InputDecoration(labelText: "Nome"),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(_quantityFocusNode)),
            TextFormField(
              decoration: InputDecoration(labelText: "Quantidade"),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              focusNode: _quantityFocusNode,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text("Categoria do Produto:"),
                const SizedBox(
                  width: 20,
                ),
                DropdownButton(
                    value: categoriaValue,
                    items: <String>["Grosso", "LeH", "Frios"]
                        .map((String value) => DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                    onChanged: (newvalue) {
                      setState(() {
                        categoriaValue = newvalue;
                      });
                    }),
              ],
            )
          ],
        )),
      ),
    );
  }
}
