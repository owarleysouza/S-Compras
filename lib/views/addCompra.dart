import 'package:flutter/material.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:intl/intl.dart';

class AddCompra extends StatefulWidget {
  final Function submeter;

  AddCompra({@required this.submeter});

  @override
  _AddCompraState createState() => _AddCompraState();
}

class _AddCompraState extends State<AddCompra> {
  final nomecontroller = TextEditingController();
  DateTime _datadacompra = DateTime.now();

  _addForm() {
    final novonome = nomecontroller.text;
    final datadacompra = _datadacompra;
    final List<Produto> produtos = [];
    /*Tava dando erro porque eu tinha definido na classe compra que se não fosse passado
    uma lista de produtos, ela seria uma lista vazia constante, só que não eh possivel add 
    um novo produto a uma lista que é vazia e constante. Então eu passo uma lista de produtos vazia
    sempre que uma compra é criada. Deve ter formas mais elegantes de resolver isso, mas ainda não conheço.
    */
    widget.submeter(novonome, datadacompra, produtos);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((dataselecionada) {
      if (dataselecionada == null) {
        return;
      } else {
        setState(() {
          _datadacompra = dataselecionada;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: 15 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Nome da Compra"),
                controller: nomecontroller,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(_datadacompra == null
                          ? "Nenhuma Data Selecionada!"
                          : "Data Selecionada: ${DateFormat('dd/MM/y').format(_datadacompra)}")),
                  FlatButton(
                      onPressed: _showDatePicker,
                      child: Text(
                        "Selecionar Data",
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      _addForm();
                    },
                    child: Text("Adicionar"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
