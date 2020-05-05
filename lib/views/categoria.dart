import 'package:flutter/material.dart';
import 'package:minhas_compras/views/produtoTemplate.dart';

class Categoria extends StatelessWidget {
  final List<Map<String, Object>> produtos;

  Categoria({@required this.produtos});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("categoria"),
          ...produtos.map((produto) => ProdutoTemplate(
              nome: produto["nome"], quantidade: produto["quantidade"])),
        ],
      ),
    );
  }
}
