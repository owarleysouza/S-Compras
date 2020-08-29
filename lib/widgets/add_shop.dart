import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:intl/intl.dart';

class AddShop extends StatefulWidget {
  final Function addShop;

  AddShop({@required this.addShop});

  @override
  _AddShopState createState() => _AddShopState();
}

class _AddShopState extends State<AddShop> {
  final _datefocusnode = FocusNode();
  final _keyform = GlobalKey<FormState>();
  String _shopname;

  DateTime _shopdate = DateTime.now();

  _showDatePicker() {
    DateTime now = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year),
      lastDate: DateTime(now.year + 1),
    ).then((selecteddate) {
      if (selecteddate == null) {
        return;
      } else {
        setState(() {
          _shopdate = selecteddate;
        });
      }
    });
  }

  _saveForm() {
    bool _isValid = _keyform.currentState.validate();

    if (!_isValid) {
      return;
    } else {
      _keyform.currentState.save();
      final newname = _shopname;
      final newshopdate = _shopdate;
      final List productslist = [
        //Resolver essas transformações aqui. Porque desse jeito não consegue-se acessar a lista de produtos dessa compra
        {
          'name': "Fuba",
          'quantidade': 2,
          'categoria': "Grosso",
          'iscomplete': true
        }
      ];
      /*Tava dando erro porque eu tinha definido na classe compra que se não fosse passado
    uma lista de produtos, ela seria uma lista vazia constante, só que não eh possivel add 
    um novo produto a uma lista que é vazia e constante. Então eu passo uma lista de produtos vazia
    sempre que uma compra é criada. Deve ter formas mais elegantes de resolver isso, mas ainda não conheço.
    */
      final novacompra = Compra(
          id: Random().nextDouble().toString(),
          nome: newname,
          data: newshopdate,
          iscompleted: false,
          listadeprodutos: productslist);
      widget.addShop(novacompra);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
            key: _keyform,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Nome"),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(_datefocusnode),
                  onSaved: (newValue) => _shopname = newValue,
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return "Informe um nome não vazio";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            "Data da Compra: ${DateFormat('dd/MM/y').format(_shopdate)}")),
                    FlatButton(
                        focusNode: _datefocusnode,
                        onPressed: _showDatePicker,
                        child: Text(
                          "Selecionar Outra Data",
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        _saveForm();
                      },
                      child: const Text("Adicionar"),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
