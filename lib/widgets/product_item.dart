import 'package:flutter/material.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/views/editProduto.dart';

/* É basicamente a tela que representa e cria a estrutura basica de um produto, e retorna isso para categoria,
que vai retornar para tela inicial*/
class ProductItem extends StatelessWidget {
  final Produto produto;
  final Function delproduto;
  final Function editproduto;
  final Function completeProduto;

  ProductItem(
      {@required this.produto,
      @required this.delproduto,
      @required this.editproduto,
      @required this.completeProduto});

  @override
  Widget build(BuildContext context) {
    String pNome = produto.nome;
    String pQuantidade = produto.quantidade;
    String pCategoria = produto.categoria;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              EditarProduto(produto: produto, editproduto: editproduto))),
      onDoubleTap: () => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Marcar Produto"),
              content: Text(
                  "Tem certeza que deseja marcar esse produto como concluído?"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      completeProduto(produto.id, false);
                      Navigator.pop(context);
                    },
                    child: Text("Desmarcar Produto")),
                FlatButton(
                    onPressed: () {
                      completeProduto(produto.id, true);
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            );
          }),
      child: Card(
        color: produto.iscomplete == true ? Colors.green[300] : Colors.white,
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
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            "$pQuantidade",
            style: TextStyle(fontSize: 20),
          ),
          trailing: IconButton(
              icon: const Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () => delproduto(produto.id)),
        ),
      ),
    );
  }
}
