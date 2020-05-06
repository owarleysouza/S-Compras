import 'package:flutter/material.dart';
import 'package:minhas_compras/views/produtoTemplate.dart';

/* Tela de categoria, que é basicamente cada bloco que representa a categoria de produtos, 
com os respectivos produtos dentro desse bloco. 
Essa classe basicamente é chamada pela tela inicial, com a lista dos produtos e o que ela faz é 
percorrer a lista de produtos transformando eles em um ProdutoTemplate usando a função map*/
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
