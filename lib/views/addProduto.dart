import 'package:flutter/material.dart';

class AddProduto extends StatefulWidget {
  final void Function(String, String, String) submeter;

  AddProduto(this.submeter);

  @override
  _AddProdutoState createState() => _AddProdutoState();
}

class _AddProdutoState extends State<AddProduto> {
  final nomeController = TextEditingController();

  final quantidadeController = TextEditingController();

  final categoriaController = TextEditingController();

  _submeterFormulario() {
    //funcao para verificar os inputs gerados. Se estiver correto, submeter o novo elemento
    final nome = nomeController.text;
    final quantidade = quantidadeController.text;
    final categoria = categoriaController.text;

    if (nome == "" || quantidade[0] == "0") {
      return;
    } else {
      widget.submeter(nome, quantidade, categoria);
    }
  }

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
            keyboardType: TextInputType.numberWithOptions(
                decimal: true), //parametro para que o teclado seja numerico
            controller: quantidadeController,
          ),
          TextField(
            decoration:
                InputDecoration(labelText: "Categoria (Grosso, LeH, Frios)"),
            controller: categoriaController,
            onSubmitted: (_) =>
                _submeterFormulario(), //Ao apertar no enter do teclado já submeter
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    _submeterFormulario();
                  },
                  child: Text("Adicionar")),
            ],
          )
        ],
      ),
    );
  }
}
