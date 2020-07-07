import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/components/addProduto.dart';
import 'package:minhas_compras/components/produtoTemplate.dart';
import 'package:minhas_compras/views/telaSemProdutos.dart';

/*Tela de produtos do app. Aqui basicamente é a tela onde são mostrados os produtos.
*/

class Produtos extends StatefulWidget {
  final Compra compra;

  Produtos({
    @required this.compra,
  });

  @override
  _ProdutosState createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  get temProdutonaLista {
    if (widget.compra.listadeprodutos.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  _addProduto(
      String nome, String quantidade, String categoria, bool iscomplete) {
    final novoProduto = Produto(
        id: Random().nextDouble().toString(),
        nome: nome,
        quantidade: quantidade,
        categoria: categoria,
        iscomplete: iscomplete);

    setState(() {
      widget.compra.listadeprodutos.add(novoProduto);
    });

    Navigator.of(context).pop();
  }

  _openAddFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddProduto(
            submeter: _addProduto,
          );
        });
  }

  _delproduto(String id) {
    setState(() {
      widget.compra.listadeprodutos.removeWhere((produto) => produto.id == id);
    });
  }

  _editproduto(String id, String nome, String quantidade, String categoria) {
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

  _completeProduto(String id, bool iscomplete) {
    for (Produto produto in widget.compra.listadeprodutos) {
      if (produto.id == id) {
        setState(() {
          produto.iscomplete = iscomplete;
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
                      .map((produtodalista) => ProdutoTemplate(
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
          : TelaVazia(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_shopping_cart),
          onPressed: () {
            _openAddFormModal(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
