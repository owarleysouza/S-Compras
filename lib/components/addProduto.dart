import 'package:flutter/material.dart';

class AddProduto extends StatefulWidget {
  final void Function(String, String, String, bool) submeter;

  AddProduto({@required this.submeter});

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

    if (nome == "" || quantidade == "0" || nome.length > 17) {
      //Nome deve ser não vazio e menor que 17 caracteres para não dá overflowed na tela. Quantidade deve ser maior que 0
      return; //Lembrar de criar widgets para tratar erros e mostrar avisos para o usuário e chamar aqui
    } else if (nome != "" && quantidade == "" && nome.length < 17) {
      widget.submeter(nome, "Padrão", categoria, false);
    } else {
      widget.submeter(nome, quantidade, categoria, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Nome"),
                controller: nomeController,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Quantidade (Vazio para qtd 'Padrão')"),
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true), //parametro para que o teclado seja numerico
                controller: quantidadeController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text("Categoria do Produto:"),
                  const SizedBox(
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
                      child: const Text("Adicionar")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}