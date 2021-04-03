import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/views/product_edit_form_screen.dart';

/* É basicamente a tela que representa e cria a estrutura basica de um produto, e retorna isso para categoria,
que vai retornar para tela inicial*/
class ProductItem extends StatelessWidget {
  final Compra shop;
  final Produto produto;
  final Function delproduto;
  final Function editproduto;
  final Function completeProduto;
  final Function completeEditProduct;

  ProductItem(
      {@required this.shop,
      @required this.produto,
      @required this.delproduto,
      @required this.editproduto,
      @required this.completeProduto,
      @required this.completeEditProduct});

  @override
  Widget build(BuildContext context) {
    String pNome = produto.nome;
    int pQuantidade = produto.quantidade;
    String pCategoria = produto.categoria;
    double pPrice = produto.price;
    return GestureDetector(
      onDoubleTap: () => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(produto.iscomplete == true
                  ? "Desmarcar Produto"
                  : "Marcar Produto"),
              content: Text(produto.iscomplete == true
                  ? "Tem certeza que deseja DESMARCAR esse produto como concluído?"
                  : "Tem certeza que deseja MARCAR esse produto como concluído?"),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar")),
                TextButton(
                    onPressed: () {
                      completeProduto(produto.id);
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            );
          }),
      child: Card(
        color:
            produto.iscomplete == true ? Colors.lightGreen[300] : Colors.white,
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
          subtitle: Text(
            "$pQuantidade | R\$ $pPrice",
            style: TextStyle(fontSize: 18),
          ),
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(
                    icon: const Icon(Icons.edit),
                    color: Theme.of(context).accentColor,
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductEditFormScreen(
                                  editproduct: editproduto,
                                  product: produto,
                                  shop: shop,
                                  completeproduct: completeProduto,
                                  completeEditProduto: completeEditProduct,
                                )))),
                IconButton(
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Remover Produto"),
                            content: Text(
                                "Tem certeza que deseja REMOVER esse produto?"),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancelar")),
                              TextButton(
                                  onPressed: () {
                                    double newShopTotalPrice = shop.totalPrice -
                                        (produto.quantidade * produto.price);
                                    delproduto(
                                        produto.id, shop, newShopTotalPrice);
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"))
                            ],
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
