import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/views/addProduto.dart';
import 'package:minhas_compras/views/produtoTemplate.dart';
import 'package:minhas_compras/views/telaVazia.dart';

/*Tela inicial do app. Aqui basicamente é a tela onde são mostrados os produtos nas suas respectivas categorias.
A mesma tem basicamente a lista de produtos, e a sua estrutura principal chama o widget categoria para ser mostrada nela 
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

  _addProduto(String nome, String quantidade, String categoria) {
    final novoProduto = Produto(
        id: Random().nextDouble().toString(),
        nome: nome,
        quantidade: quantidade,
        categoria: categoria);

    setState(() {
      widget.compra.listadeprodutos.add(novoProduto);
    });

    Navigator.of(context).pop();
  }

  _openAddFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddProduto(_addProduto);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe5e5e5),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.compra.nome,
        ),
        /*actions: <Widget>[
          //Fica a reflexão e a possibilidade de fazer isso aqui. Mas seguindo a lei de fitts tou retirando o botão
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                  color: Theme.of(context).accentColor,
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    _openAddFormModal(context);
                  }))
        ],*/
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
                          )),
                  SizedBox(
                    //Elemento para que o float button nao fique encima do ultimo produto
                    height: 60,
                  )
                ],
              ),
            )
          : TelaVazia(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_shopping_cart),
          onPressed: () {
            _openAddFormModal(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
