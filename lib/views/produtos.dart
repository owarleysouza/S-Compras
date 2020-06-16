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
  @override
  _ProdutosState createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  final _compras =
      Compra(nome: "Compra de Julho", data: DateTime.now(), listadeprodutos: [
    Produto(nome: "Açúcar", quantidade: "2x", categoria: "Grosso"),
    Produto(nome: "Sal", quantidade: "Padrão", categoria: "Grosso"),
    Produto(nome: "Desinfetante", quantidade: "3x", categoria: "LeH"),
    Produto(nome: "Desodorante", quantidade: "1x", categoria: "LeH"),
    Produto(nome: "Sabonete", quantidade: "Padrão", categoria: "LeH"),
    Produto(nome: "Fio Dental", quantidade: "2x", categoria: "LeH"),
    Produto(nome: "Lâmina de Barbear", quantidade: "Padrão", categoria: "LeH"),
    Produto(nome: "Peixe", quantidade: "3x", categoria: "Frios"),
    Produto(nome: "Salsicha", quantidade: "1x", categoria: "Frios"),
  ]);

  get temProdutonaLista {
    if (_compras.listadeprodutos.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  _addProduto(String nome, String quantidade, String categoria) {
    final novoProduto =
        Produto(nome: nome, quantidade: quantidade, categoria: categoria);

    setState(() {
      _compras.listadeprodutos.add(novoProduto);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe5e5e5),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          _compras.nome,
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
                  ..._compras.listadeprodutos.map((produtos) => ProdutoTemplate(
                        nome: produtos.nome,
                        quantidade: produtos.quantidade,
                        categoria: produtos.categoria,
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
