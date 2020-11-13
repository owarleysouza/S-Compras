import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/providers/shops_provider.dart';

import 'package:provider/provider.dart';

class ShopEditFormScreen extends StatefulWidget {
  final Compra shop;

  ShopEditFormScreen(this.shop);

  @override
  _ShopEditFormScreenState createState() => _ShopEditFormScreenState();
}

class _ShopEditFormScreenState extends State<ShopEditFormScreen> {
  bool _isLoading = false;
  final _dataFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  String _shopName;
  DateTime _shopDate;

  void initState() {
    super.initState();
    _shopDate = widget.shop.data;
  }

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
          _shopDate = selecteddate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Compra compra = Provider.of<Compra>(context);
    Future<void> Function(String, String, DateTime) editshop =
        Provider.of<ShopProvider>(context).editshop;

    _saveForm() async {
      bool _isValid = _form.currentState.validate();

      if (!_isValid) {
        return;
      } else {
        setState(() {
          _isLoading = true;
        });

        _form.currentState.save();
        await editshop(compra.id, _shopName, _shopDate);
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Editar Compra")),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                  key: _form,
                  child: ListView(
                    children: [
                      TextFormField(
                        initialValue: compra.nome,
                        decoration: InputDecoration(labelText: "Nome"),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) =>
                            FocusScope.of(context).requestFocus(_dataFocusNode),
                        onSaved: (newValue) => _shopName = newValue,
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return "Informe um nome válido";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                                "Data da Compra: ${DateFormat('dd/MM/yyyy').format(_shopDate)}"),
                          ),
                          FlatButton(
                              focusNode: _dataFocusNode,
                              onPressed: _showDatePicker,
                              child: Text("Selecionar Outra Data",
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                  )))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RaisedButton(
                            color: Theme.of(context).accentColor,
                            onPressed: () => _saveForm(),
                            child: Text("Salvar"),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
    );
  }
}
