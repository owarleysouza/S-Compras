import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/views/produtos.dart';

class CompraTemplate extends StatelessWidget {
  final String nome;
  final DateTime data;
  final List<Produto> listadeprodutos;

  CompraTemplate(
      {@required this.nome,
      @required this.data,
      @required this.listadeprodutos});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                Produtos(nome: nome, listadeprodutos: listadeprodutos)));
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                backgroundColor: Color(0xFF14213D),
                radius: 30,
                child: Text(listadeprodutos.length.toString()),
              ),
            ),
            title: Text(nome),
            subtitle: Text((DateFormat('dd/MM/y').format(data))),
          ),
        ),
      ),
    );
  }
}
