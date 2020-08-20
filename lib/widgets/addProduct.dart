import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  final void Function(String, int, String, bool) addProduct;

  AddProduct({@required this.addProduct});

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _quantityFocusNode = FocusNode();
  final _categoryFocusNode = FocusNode();
  final _keyform = GlobalKey<FormState>(); //Recebe o estado atual daquele form

  String _productName;
  int _productQuantity;
  String _productCategory = "Grosso";

  _saveForm() {
    bool _isValid = _keyform.currentState.validate();

    if (!_isValid) {
      return;
    } else {
      _keyform.currentState.save();
      widget.addProduct(
          _productName, _productQuantity, _productCategory, false);
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
                        FocusScope.of(context).requestFocus(_quantityFocusNode),
                    onSaved: (newValue) => _productName = newValue,
                    validator: (value) {
                      if (value.length > 17) {
                        return "Informe um nome de produto menor";
                      } else if (value.trim().isEmpty) {
                        return "Informe um nome de produto não vazio";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Quantidade ('0' para quantidade Padrão)"),
                    textInputAction: TextInputAction.next,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    focusNode: _quantityFocusNode,
                    onFieldSubmitted: (value) =>
                        FocusScope.of(context).requestFocus(_categoryFocusNode),
                    onSaved: (newValue) =>
                        _productQuantity = int.parse(newValue),
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return "Informe uma quantidade válida";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Categoria:"),
                      SizedBox(
                        width: 20,
                      ),
                      DropdownButton(
                        focusNode: _categoryFocusNode,
                        value: _productCategory,
                        items: <String>["Grosso", "LeH", "Frios"]
                            .map((String item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                ))
                            .toList(),
                        onChanged: (newvalue) {
                          setState(() {
                            _productCategory =
                                newvalue; //Ainda tem um bug ao fazer isso, que é: Quando é mudado o valor do dropdown e volta pra tela anterior, aquele atributo fica com o valor mudado
                          });
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                          color: Theme.of(context).accentColor,
                          onPressed: () {
                            _saveForm();
                          },
                          child: const Text("Adicionar")),
                    ],
                  )
                ],
              ))),
    );
  }
}
