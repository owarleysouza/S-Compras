import 'package:flutter/material.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/views/produtoTemplate.dart';

/* Tela de categoria, que é basicamente cada bloco que representa a categoria de produtos, 
com os respectivos produtos dentro desse bloco. 
Essa classe basicamente é chamada pela tela inicial, com a lista dos produtos e o que ela faz é 
percorrer a lista de produtos transformando eles em um ProdutoTemplate usando a função map*/
class Categoria extends StatelessWidget {
  final List<List<Produto>> produtos;

  Categoria({@required this.produtos});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Grosso",
          style: TextStyle(
              fontSize: 25,
              color: Color(0xFF264653),
              fontWeight: FontWeight.bold),
        ),
        ...produtos[0].map((produtoGrossos) => ProdutoTemplate(
              nome: produtoGrossos.nome,
              quantidade: produtoGrossos.quantidade,
              categoria: produtoGrossos.categoria,
            )),
        Text(
          "Limpeza e Higiene",
          style: TextStyle(
              fontSize: 25,
              color: Color(0xFF264653),
              fontWeight: FontWeight.bold),
        ),
        ...produtos[1].map((produtoLeH) => ProdutoTemplate(
              nome: produtoLeH.nome,
              quantidade: produtoLeH.quantidade,
              categoria: produtoLeH.categoria,
            )),
        Text(
          "Frios",
          style: TextStyle(
              fontSize: 25,
              color: Color(0xFF264653),
              fontWeight: FontWeight.bold),
        ),
        ...produtos[2].map((produtoFrios) => ProdutoTemplate(
              nome: produtoFrios.nome,
              quantidade: produtoFrios.quantidade,
              categoria: produtoFrios.categoria,
            ))
      ],
    );
  }
}
