import 'package:flutter/material.dart';
import 'package:minhas_compras/models/produto.dart';

class ImportProductItem extends StatelessWidget {
  final Produto produto;

  ImportProductItem({
    @required this.produto,
  });

  @override
  Widget build(BuildContext context) {
    String pNome = produto.nome;
    int pQuantidade = produto.quantidade;
    String pCategoria = produto.categoria;
    return Card(
      color: produto.iscomplete == true ? Colors.lightGreen[300] : Colors.white,
      margin: EdgeInsets.fromLTRB(6, 9, 6, 9),
      elevation: 7,
      child: ListTile(
        leading: Image.asset(
          'assets/images/$pCategoria.png',
          width: 30,
          height: 30,
        ),
        title: Text(
          pNome,
          style: TextStyle(fontSize: 18),
        ),
        subtitle: pQuantidade == 0
            ? Text(
                "Padrão",
                style: TextStyle(fontSize: 18),
              )
            : Text(
                "$pQuantidade",
                style: TextStyle(fontSize: 18),
              ),
        trailing: IconButton(
            icon: const Icon(Icons.file_download),
            color: Theme.of(context).accentColor,
            onPressed: null), //TODO: Implementar método para importar produto
      ),
    );
  }
}
