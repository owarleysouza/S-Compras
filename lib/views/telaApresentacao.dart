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
            style: TextStyle(decoration: TextDecoration.none, fontSize: 20),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  height: 180,
                  color: Colors.black,
                  child: Text(
                    "Elemento 1",
                    style: TextStyle(
                        decoration: TextDecoration.none, fontSize: 15),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                    height: 180,
                    color: Colors.grey,
                    child: Text(
                      "Elemento 2",
                      style: TextStyle(
                          decoration: TextDecoration.none, fontSize: 15),
                    )),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    height: 180,
                    color: Colors.blueGrey,
                    child: Text(
                      "Elemento 3",
                      style: TextStyle(
                          decoration: TextDecoration.none, fontSize: 15),
                    )),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: RaisedButton(
                child: const Text("Avançar"),
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
