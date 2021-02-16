import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/providers/shops_provider.dart';

import 'package:minhas_compras/utils/constants_key.dart';
import 'package:minhas_compras/views/import_products_screen.dart';
import 'package:minhas_compras/widgets/add_product.dart';
import 'package:minhas_compras/widgets/product_item.dart';
import 'package:minhas_compras/views/empty_screen.dart';
import 'package:provider/provider.dart';

/*Tela de produtos do app. Aqui basicamente é a tela onde são mostrados os produtos.
*/

// ignore: must_be_immutable
class Produtos extends StatefulWidget {
  final compra;
  String token;
  String userId;

  Produtos(
      {@required this.compra, @required this.token, @required this.userId});

  @override
  _ProdutosState createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  final String _baseShopUrl = '${Constants.BASE_API_URL}/shops';

  get temProdutonaLista {
    if (widget.compra.listadeprodutos.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  String get token {
    return widget.token;
  }

  String get userId {
    return widget.userId;
  }

  Future<void> _addProduto(
      String nome, int quantidade, String categoria, bool iscomplete) async {
    final shopId = widget.compra.id;
    List products = widget.compra.listadeprodutos;

    final novoProduto = Produto(
        id: Random().nextDouble().toString(),
        nome: nome,
        quantidade: quantidade,
        categoria: categoria,
        iscomplete: iscomplete,
        price: 0.0);

    setState(() {
      products.add(novoProduto);
    });

    await http.patch('$_baseShopUrl/$userId/$shopId.json?auth=$token',
        body: json.encode({
          'name': widget.compra.nome,
          'date': widget.compra.data.toString(),
          'iscompleted': widget.compra.iscompleted,
          'products': products
              .map((product) => {
                    'id': product.id,
                    'nome': product.nome,
                    'quantidade': product.quantidade,
                    'categoria': product.categoria,
                    'iscomplete': product.iscomplete,
                    'price': product.price
                  })
              .toList()
        }));

    Navigator.of(context).pop();
  }

  _openAddFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddProduct(addProduct: _addProduto);
        });
  }

  Future<void> _editproduto(String id, String nome, int quantidade,
      String categoria, double price) async {
    final shopId = widget.compra.id;
    List products = widget.compra.listadeprodutos;

    for (Produto produto in products) {
      if (produto.id == id) {
        setState(() {
          produto.nome = nome;
          produto.quantidade = quantidade;
          produto.categoria = categoria;
          produto.price = price;
        });
      }
    }

    await http.patch('$_baseShopUrl/$userId/$shopId.json?auth=$token',
        body: json.encode({
          'products': products
              .map((product) => {
                    'id': product.id,
                    'nome': product.nome,
                    'quantidade': product.quantidade,
                    'categoria': product.categoria,
                    'iscomplete': product.iscomplete,
                    'price': product.price
                  })
              .toList()
        }));
  }

  Future<void> _delproduto(String id, Compra shop, double newPrice) async {
    ShopProvider shopProvider =
        Provider.of<ShopProvider>(context, listen: false);

    shopProvider.editshop(shop.id, shop.nome, shop.data, newPrice);

    final shopId = widget.compra.id;
    List products = widget.compra.listadeprodutos;
    setState(() {
      products.removeWhere((produto) => produto.id == id);
    });

    await http.patch('$_baseShopUrl/$userId/$shopId.json?auth=$token',
        body: json.encode({
          'products': products
              .map((product) => {
                    'id': product.id,
                    'nome': product.nome,
                    'quantidade': product.quantidade,
                    'categoria': product.categoria,
                    'iscomplete': product.iscomplete,
                    'price': product.price
                  })
              .toList()
        }));
    setState(() {
      shop.totalPrice = newPrice;
    });
  }

  _completeProduto(String id) {
    for (Produto produto in widget.compra.listadeprodutos) {
      if (produto.id == id) {
        setState(() {
          produto.toggleCompleteProduct(token, widget.compra, userId);
        });
      }
    }
  }

  _completeEditProduto(String id) {
    for (Produto produto in widget.compra.listadeprodutos) {
      if (produto.id == id) {
        setState(() {
          produto.toggleCompleteEditProduct(token, widget.compra, userId);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe5e5e5),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.compra.nome,
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.file_download),
              color: Colors.white,
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ImportProductsScreen(
                        newShop: widget.compra,
                      ))))
        ],
      ),
      body: temProdutonaLista
          ? Container(
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: Text("Valor Total:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 10, 10),
                        child: Text(
                          "R\$ ${widget.compra.totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text(
                      "Categoria Grosso",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...widget.compra.listadeprodutos.map(
                      (produtodalista) => produtodalista.categoria == "Grosso"
                          ? ProductItem(
                              shop: widget.compra,
                              produto: produtodalista,
                              delproduto: _delproduto,
                              editproduto: _editproduto,
                              completeProduto: _completeProduto,
                              completeEditProduct: _completeEditProduto,
                            )
                          : SizedBox()),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text(
                      "Categoria Limpeza e Higiene",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...widget.compra.listadeprodutos
                      .map((produtodalista) => produtodalista.categoria == "LeH"
                          ? ProductItem(
                              shop: widget.compra,
                              produto: produtodalista,
                              delproduto: _delproduto,
                              editproduto: _editproduto,
                              completeProduto: _completeProduto,
                              completeEditProduct: _completeEditProduto,
                            )
                          : SizedBox()),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text(
                      "Categoria Frios",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...widget.compra.listadeprodutos.map(
                      (produtodalista) => produtodalista.categoria == "Frios"
                          ? ProductItem(
                              shop: widget.compra,
                              produto: produtodalista,
                              delproduto: _delproduto,
                              editproduto: _editproduto,
                              completeProduto: _completeProduto,
                              completeEditProduct: _completeEditProduto,
                            )
                          : SizedBox()),
                  const SizedBox(
                    //Elemento para que o float button nao fique encima do ultimo produto
                    height: 60,
                  )
                ],
              ),
            )
          : EmptyScreen(texto: "Ainda nenhum produto! :("),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_shopping_cart),
          onPressed: () {
            _openAddFormModal(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
