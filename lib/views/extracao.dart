import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/views/categoria.dart';

class Extracao extends StatelessWidget {
  final produtos;

  Extracao({@required this.produtos});

  extracao(List produtos) {
    final produtosGrossos = [];
    final produtosLeH = [];
    final produtosFrios = [];
    final produtosgeral = [];

    for (Produto p in produtos) {
      if (p.categoria == "Grosso") {
        produtosGrossos.add(p);
      } else if (p.categoria == "LeH") {
        produtosLeH.add(p);
      } else if (p.categoria == "Frios") {
        produtosFrios.add(p);
      }
    }
    produtosgeral.add(produtosGrossos);
    produtosgeral.add(produtosLeH);
    produtosgeral.add(produtosFrios);

    return produtosgeral;
  }

  @override
  Widget build(BuildContext context) {
    final List produtosg = extracao(produtos)[0];
    final List produtosleh = extracao(produtos)[1];
    final List produtosf = extracao(produtos)[2];

    return Categoria(
        produtosG: produtosg, produtosLeH: produtosleh, produtosF: produtosf);
  }
}
