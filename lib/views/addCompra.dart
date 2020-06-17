import 'package:flutter/material.dart';

class AddCompra extends StatefulWidget {
  final Function submeter;

  AddCompra({@required this.submeter});

  @override
  _AddCompraState createState() => _AddCompraState();
}

class _AddCompraState extends State<AddCompra> {
  final nomecontroller = TextEditingController();

  _addForm() {
    final novonome = nomecontroller.text;
    widget.submeter(novonome);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Nome da Compra"),
            controller: nomecontroller,
          ),
          Row(
            children: <Widget>[
              Expanded(child: Text("Data Selecionada: ")),
              FlatButton(onPressed: null, child: Text("Selecionar Data"))
            ],
          ),
          RaisedButton(
            onPressed: () {
              _addForm();
            },
            child: Text("Adicionar"),
          )
        ],
      ),
    );
  }
}
