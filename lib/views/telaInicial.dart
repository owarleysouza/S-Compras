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
    {"nome": "Feijão", "quantidade": 2, "categoria": "Grosso"},
    {"nome": "Arroz", "quantidade": 5, "categoria": "Grosso"},
    {"nome": "Desinfetante", "quantidade": 1, "categoria": "Limpeza"},
    {"nome": "Sabão", "quantidade": 8, "categoria": "Limpeza"},
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
        title: Text("Minhas Compras - Master"),
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
