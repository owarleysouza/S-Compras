import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/widgets/import_product_item.dart';

class ImportProductsScreen extends StatefulWidget {
  final Compra compra;

  ImportProductsScreen({@required this.compra});
  @override
  _ImportProductsScreenState createState() => _ImportProductsScreenState();
}

class _ImportProductsScreenState extends State<ImportProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compras"),
      ),
      body: ListView(
        children: [
          //TODO: Corrigir isso aqui. Não é para listar todos os produtos da compra atual, é pra listar todas as compras
          //e depois todos os produtos de cada compra respectivamente, para assim o user escolher qual produto quer
          ...widget.compra.listadeprodutos
              .map((product) => ImportProductItem(produto: product))
        ],
      ),
    );
  }
}
