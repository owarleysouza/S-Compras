import 'package:flutter/material.dart';
import 'package:minhas_compras/models/produto.dart';

class EditarProduto extends StatefulWidget {
  final Produto produto;
  final Function editproduto;
  EditarProduto({@required this.produto, @required this.editproduto});

  @override
  _EditarProdutoState createState() => _EditarProdutoState();
}

class _EditarProdutoState extends State<EditarProduto> {
  final nomeController = TextEditingController();
  final quantidadeController = TextEditingController();
  String categoriaValue = "Grosso";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Nome"),
            controller: nomeController,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "Quantidade (Vazio para qtd 'Padrão')"),
            keyboardType: TextInputType.numberWithOptions(
                decimal: true), //parametro para que o teclado seja numerico
            controller: quantidadeController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Categoria do Produto:"),
              SizedBox(
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    widget.editproduto(widget.produto.id, nomeController.text,
                        quantidadeController.text, categoriaValue);
                    Navigator.pop(context);
                  },
                  child: Text("Editar")),
            ],
          )
        ],
      ),
    );
  }
}
