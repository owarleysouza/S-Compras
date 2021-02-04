import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/providers/shops_provider.dart';
import 'package:provider/provider.dart';

class ProductEditFormScreen extends StatefulWidget {
  final Compra shop;
  final Produto product;
  final Function editproduct;
  final Function completeproduct;
  final Function completeEditProduto;
  ProductEditFormScreen(
      {@required this.editproduct,
      @required this.product,
      @required this.shop,
      @required this.completeproduct,
      @required this.completeEditProduto});

  @override
  _ProductEditFormScreenState createState() => _ProductEditFormScreenState();
}

class _ProductEditFormScreenState extends State<ProductEditFormScreen> {
  final _quantityFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  String _productName;
  int _productQuantity;
  String _productCategory;
  double _productPrice;

  void initState() {
    super.initState();
    _productCategory = widget.product.categoria;
  }

  _calculateShopPrice(
      double shopPrice, double oldProductPrice, double newProductPrice) {
    double newShopPrice = (shopPrice - oldProductPrice) + newProductPrice;
    return newShopPrice;
  }

  _saveForm() {
    bool _isValid = _form.currentState.validate();

    if (!_isValid) {
      return;
    } else {
      _form.currentState.save();

      if (_productPrice != widget.product.price) {
        ShopProvider shopProvider =
            Provider.of<ShopProvider>(context, listen: false);
        double newShopPrice = _calculateShopPrice(
            widget.shop.totalPrice,
            widget.product.price * widget.product.quantidade,
            _productQuantity == widget.product.quantidade
                ? _productPrice * widget.product.quantidade
                : _productPrice * _productQuantity);
        shopProvider.editshop(
            widget.shop.id, widget.shop.nome, widget.shop.data, newShopPrice);
        widget.editproduct(widget.product.id, _productName, _productQuantity,
            _productCategory, _productPrice);
        widget.completeEditProduto(widget.product.id);
        shopProvider.loadShops();

        setState(() {
          widget.shop.totalPrice = newShopPrice;
        });
        //Altera valor da compra. Diminui dela o preco atual, e soma o _productPrice
      } else {
        widget.editproduct(widget.product.id, _productName, _productQuantity,
            _productCategory, _productPrice);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Produto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  initialValue: widget.product.nome,
                  decoration: InputDecoration(labelText: "Nome"),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(_quantityFocusNode),
                  onSaved: (newValue) => _productName = newValue,
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Informe um nome válido';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                    initialValue: widget.product.quantidade.toString(),
                    decoration: InputDecoration(labelText: "Quantidade"),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) =>
                        FocusScope.of(context).requestFocus(_priceFocusNode),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    focusNode: _quantityFocusNode,
                    onSaved: (newValue) => _productQuantity = int.parse(
                        newValue), //Fazer verificação melhor aqui para validar se entrada do user é mesmo um inteiro
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'Informe uma quantidade válida';
                      } else {
                        return null;
                      }
                    }),
                TextFormField(
                    initialValue: widget.product.price.toString(),
                    decoration: InputDecoration(labelText: "Preço"),
                    textInputAction: TextInputAction.next,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    focusNode: _priceFocusNode,
                    onSaved: (newValue) => _productPrice = double.parse(
                        newValue), //Fazer verificação melhor aqui para validar se entrada do user é mesmo um inteiro
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'Informe um preço válido';
                      } else {
                        return null;
                      }
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text("Categoria do Produto:"),
                    const SizedBox(
                      width: 20,
                    ),
                    DropdownButton(
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
                        }),
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
                        child: const Text("Editar")),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
