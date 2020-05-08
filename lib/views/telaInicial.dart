import 'package:flutter/material.dart';
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
  final List<Map<String, Object>> produtos = [
    {"nome": "Feijão", "quantidade": "2x", "categoria": "Grosso"},
    {"nome": "Arroz", "quantidade": "5x", "categoria": "Grosso"},
    {
      "nome": "Desinfetante",
      "quantidade": "3x",
      "categoria": "Limpeza e Higiene"
    },
    {
      "nome": "Desodorante",
      "quantidade": "1x",
      "categoria": "Limpeza e Higiene"
    },
    {"nome": "Macarrão", "quantidade": "1x", "categoria": "Grosso"},
    {
      "nome": "Sabonete",
      "quantidade": "Padrão",
      "categoria": "Limpeza e Higiene"
    },
    {"nome": "Açúcar", "quantidade": "2x", "categoria": "Grosso"},
    {"nome": "Sal", "quantidade": "Padrão", "categoria": "Grosso"},
    {
      "nome": "Fio Dental",
      "quantidade": "2x",
      "categoria": "Limpeza e Higiene"
    },
    {
      "nome": "Lâmina de Barbear",
      "quantidade": "Padrão",
      "categoria": "Limpeza e Higiene"
    },
    {"nome": "Salsicha", "quantidade": "1x", "categoria": "Frios"},
  ];

  int _produtonalista = 0;

  get temProdutonaLista {
    if (_produtonalista < (produtos.length)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Compras"),
      ),
      body: temProdutonaLista
          ? SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[Categoria(produtos: produtos)],
                ),
              ),
            )
          : TelaVazia(),
    );
  }
}
