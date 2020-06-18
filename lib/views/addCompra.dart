import 'package:flutter/material.dart';
import 'package:minhas_compras/models/produto.dart';

class AddCompra extends StatefulWidget {
  final Function submeter;

  AddCompra({@required this.submeter});

  @override
  _AddCompraState createState() => _AddCompraState();
}

class _AddCompraState extends State<AddCompra> {
  final nomecontroller = TextEditingController();

  _addForm() {
    final novonome = nomecontroller.text;
    final List<Produto> produtos = [];
    /*Tava dando erro porque eu tinha definido na classe compra que se não fosse passado
    uma lista de produtos, ela seria uma lista vazia constante, só que não eh possivel add 
    um novo produto a uma lista que é vazia e constante. Então eu passo uma lista de produtos vazia
    sempre que uma compra é criada. Deve ter formas mais elegantes de resolver isso, mas ainda não conheço.
    */
    widget.submeter(novonome, produtos);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Nome da Compra"),
            controller: nomecontroller,
          ),
          Row(
            children: <Widget>[
              Expanded(child: Text("Data Selecionada: ")),
              FlatButton(onPressed: null, child: Text("Selecionar Data"))
            ],
          ),
          RaisedButton(
            onPressed: () {
              _addForm();
            },
            child: Text("Adicionar"),
          )
        ],
      ),
    );
  }
}
