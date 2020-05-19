import 'package:flutter/material.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/views/addProduto.dart';
import 'package:minhas_compras/views/categoria.dart';
import 'package:minhas_compras/views/telaVazia.dart';

/*Tela inicial do app. Aqui basicamente é a tela onde são mostrados os produtos nas suas respectivas categorias.
A mesma tem basicamente a lista de produtos, e a sua estrutura principal chama o widget categoria para ser mostrada nela 
*/
class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final _produtos = [
    [
      Produto(nome: "Feijão", quantidade: "2x", categoria: "Grosso"),
      Produto(nome: "Arroz", quantidade: "5x", categoria: "Grosso"),
      Produto(nome: "Macarrão", quantidade: "1x", categoria: "Grosso"),
      Produto(nome: "Fuba", quantidade: "11x", categoria: "Grosso"),
      Produto(nome: "Açúcar", quantidade: "2x", categoria: "Grosso"),
      Produto(nome: "Sal", quantidade: "Padrão", categoria: "Grosso"),
    ],
    [
      Produto(nome: "Desinfetante", quantidade: "3x", categoria: "LeH"),
      Produto(nome: "Desodorante", quantidade: "1x", categoria: "LeH"),
      Produto(nome: "Sabonete", quantidade: "Padrão", categoria: "LeH"),
      Produto(nome: "Fio Dental", quantidade: "2x", categoria: "LeH"),
      Produto(
          nome: "Lâmina de Barbear", quantidade: "Padrão", categoria: "LeH"),
    ],
    [
      Produto(nome: "Peixe", quantidade: "3x", categoria: "Frios"),
      Produto(nome: "Salsicha", quantidade: "1x", categoria: "Frios"),
    ]
  ];

  int _produtonalista = 0;

  get temProdutonaLista {
    if (_produtonalista < (_produtos.length)) {
      return true;
    } else {
      return false;
    }
  }

  _addProduto(String nome, String quantidade, String categoria) {
    final novoProduto =
        Produto(nome: nome, quantidade: quantidade, categoria: categoria);

    setState(() {
      if (categoria == "Grosso") {
        _produtos[0].add(novoProduto);
      } else if (categoria == "LeH") {
        _produtos[1].add(novoProduto);
      } else if (categoria == "Frios") {
        _produtos[2].add(novoProduto);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Compras"),
      ),
      body: temProdutonaLista
          ? Container(
              height: 500,
              child: ListView(
                children: <Widget>[
                  Categoria(produtos: _produtos),
                  AddProduto(_addProduto)
                ],
              ),
            )
          : TelaVazia(),
    );
  }
}
