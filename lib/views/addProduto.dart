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

  String categoriavalue = "Grosso";

  _submeterFormulario() {
    //funcao para verificar os inputs gerados. Se estiver correto, submeter o novo elemento
    final nome = nomeController.text;
    final quantidade = quantidadeController.text;
    final categoria = categoriavalue;

    if (nome == "" || quantidade[0] == "0" || nome.length > 17) {
      //Nome deve ser não vazio e menor que 17 caracteres para não dá overflowed na tela. Quantidade deve ser maior que 0
      return; //Lembrar de criar widgets para tratar erros e mostrar avisos para o usuário e chamar aqui
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Categoria do Produto:"),
              SizedBox(
                width: 20,
              ),
              DropdownButton(
                  value: categoriavalue,
                  items: <String>["Grosso", "LeH", "Frios"]
                      .map((String value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (newvalue) {
                    setState(() {
                      categoriavalue = newvalue;
                    });
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                  color: Theme.of(context).accentColor,
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
