import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/widgets/add_product.dart';
import 'package:minhas_compras/widgets/product_item.dart';
import 'package:minhas_compras/views/empty_screen.dart';

/*Tela de produtos do app. Aqui basicamente é a tela onde são mostrados os produtos.
*/

class Produtos extends StatefulWidget {
  final compra;

  Produtos({
    @required this.compra,
  });

  @override
  _ProdutosState createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  final String _baseUrl = 'https://flutter-minhascompras.firebaseio.com/shops';

  get temProdutonaLista {
    if (widget.compra.listadeprodutos.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> _addProduto(
      String nome, int quantidade, String categoria, bool iscomplete) async {
    final shopId = widget.compra.id;
    List products = widget.compra.listadeprodutos;
    await http.patch('$_baseUrl/$shopId.json',
        body: json.encode({
          'name': widget.compra.nome,
          'date': widget.compra.data.toString(),
          'iscompleted': widget.compra.iscompleted,
          'products': products
              .map((product) => {
                    'nome': product.nome,
                    'quantidade': product.quantidade,
                    'categoria': product.categoria,
                    'iscomplete': product.iscomplete
                  })
              .toList()
        }));

    final novoProduto = Produto(
        id: Random().nextDouble().toString(),
        nome: nome,
        quantidade: quantidade,
        categoria: categoria,
        iscomplete: iscomplete);

    setState(() {
      products.add(novoProduto);
    });

    Navigator.of(context).pop();
  }

  _openAddFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddProduct(addProduct: _addProduto);
        });
  }

  _delproduto(String id) {
    setState(() {
      widget.compra.listadeprodutos.removeWhere((produto) => produto.id == id);
    });
  }

  _editproduto(String id, String nome, int quantidade, String categoria) {
    for (Produto produto in widget.compra.listadeprodutos) {
      if (produto.id == id) {
        setState(() {
          produto.nome = nome;
          produto.quantidade = quantidade;
          produto.categoria = categoria;
        });
      }
    }
  }

  _completeProduto(String id) {
    for (Produto produto in widget.compra.listadeprodutos) {
      if (produto.id == id) {
        setState(() {
          produto.iscomplete = !produto.iscomplete;
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
        ),
      ),
      body: temProdutonaLista
          ? Container(
              height: 500,
              child: ListView(
                children: <Widget>[
                  ...widget.compra.listadeprodutos
                      .map((produtodalista) => ProductItem(
                            produto: produtodalista,
                            delproduto: _delproduto,
                            editproduto: _editproduto,
                            completeProduto: _completeProduto,
                          )),
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
