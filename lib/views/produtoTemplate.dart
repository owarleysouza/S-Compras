import 'package:flutter/material.dart';

/* É basicamente a tela que representa e cria a estrutura basica de um produto, e retorna isso para categoria,
que vai retornar para tela inicial*/
class ProdutoTemplate extends StatelessWidget {
  final String nome;
  final String quantidade;

  ProdutoTemplate({@required this.nome, @required this.quantidade});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      margin: EdgeInsets.fromLTRB(6, 9, 6, 9),
      decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            //Propriedade para adicionar sombra ao container, tanto o blur e spread que definem o degrade da sombra como o offset que define largura e altura da sombra
            BoxShadow(
              color: Colors.black87,
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: Offset(
                1.5,
                2.0,
              ),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            //icone/imagem, Acho que um ícone para cada categoria
            "IcCat",
            style: TextStyle(fontSize: 10),
          ),
          Text(
            nome,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "$quantidade",
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
