import 'package:flutter/material.dart';

//Tela de Apresentacao onde serão mostradas as funcionalidades do app
class TelaApresentacao extends StatefulWidget {
  @override
  _TelaApresentacaoState createState() => _TelaApresentacaoState();
}

class _TelaApresentacaoState extends State<TelaApresentacao> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset(
            'assets/images/logo.png',
            width: 80,
            height: 80,
          ),
          Text(
            "Carrossel",
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 20,
                decoration: TextDecoration.none),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: RaisedButton(
                child: Text("Logar"),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      'login'); //Como foram definidas no main rotas nomeadas, é só chamar pelo nome que está lá
                }),
          )
        ],
      ),
    );
  }
}
