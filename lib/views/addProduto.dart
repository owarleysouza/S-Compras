import 'package:flutter/material.dart';

class AddProduto extends StatelessWidget {
  final nomeController = TextEditingController();
  final quantidadeController = TextEditingController();
  final categoriaController = TextEditingController();
  final void Function(String, String, String) submeter;

  AddProduto(this.submeter);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Nome"),
            controller: nomeController,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Quantidade"),
            controller: quantidadeController,
          ),
          TextField(
            decoration:
                InputDecoration(labelText: "Categoria (Grosso, LeH, Frios)"),
            controller: categoriaController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    final nome = nomeController.text;
                    final quantidade = quantidadeController.text;
                    final categoria = categoriaController.text;
                    submeter(nome, quantidade, categoria);
                  },
                  child: Text("Adicionar")),
            ],
          )
        ],
      ),
    );
  }
}
