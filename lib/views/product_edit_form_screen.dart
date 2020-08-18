import 'package:flutter/material.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:provider/provider.dart';

class ProductFormScreen extends StatefulWidget {
  final Function editproduto;
  ProductFormScreen({@required this.editproduto});

  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _quantityFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final produto = Provider.of<Produto>(context);

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
                    value: produto.categoria,
                    items: <String>["Grosso", "LeH", "Frios"]
                        .map((String item) => DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: (newvalue) {
                      setState(() {
                        produto.categoria =
                            newvalue; //Ainda tem um bug ao fazer isso, que é: Quando é mudado o valor do dropdown e volta pra tela anterior, aquele atributo fica com o valor mudado
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      widget.editproduto(produto.id, "PreviewNome",
                          "PreviewQuantidade", produto.categoria);
                      Navigator.pop(context);
                    },
                    child: const Text("Editar")),
              ],
            )
          ],
        )),
      ),
    );
  }
}
