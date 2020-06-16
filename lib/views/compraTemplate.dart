import 'package:flutter/material.dart';

class CompraTemplate extends StatelessWidget {
  final String nome;
  final DateTime data;
  final int quantidadeitens;

  CompraTemplate(
      {@required this.nome,
      @required this.data,
      @required this.quantidadeitens});

  @override
  Widget build(BuildContext context) {
    return Card(
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
              child: Text(quantidadeitens.toString()),
            ),
          ),
          title: Text(nome),
          subtitle: Text(data.toString()),
        ),
      ),
    );
  }
}
