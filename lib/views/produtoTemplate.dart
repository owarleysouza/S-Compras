import 'package:flutter/material.dart';

/* É basicamente a tela que representa e cria a estrutura basica de um produto, e retorna isso para categoria,
que vai retornar para tela inicial*/
class ProdutoTemplate extends StatelessWidget {
  final String nome;
  final String quantidade;
  final String categoria;

  ProdutoTemplate(
      {@required this.nome,
      @required this.quantidade,
      @required this.categoria});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(6, 9, 6, 9),
      elevation: 7, //Sombra do widget card
      child: Padding(
        //Espaçamento geral dos elementos da coluna para o widget card
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              'images/$categoria.png',
              width: 30,
              height: 30,
            ),
            Text(
              nome,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "$quantidade",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
