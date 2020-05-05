import 'package:flutter/material.dart';

class ProdutoTemplate extends StatelessWidget {
  final String nome;
  final int quantidade;

  ProdutoTemplate({@required this.nome, @required this.quantidade});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //icone/imagem,
          Text(nome),
          Text("----"),
          Text("${quantidade}x")
        ],
      ),
    );
  }
}
