import 'package:flutter/material.dart';

//Tela de Login do app
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Material(
      //Aqui é usado o Material porque o TextField precisa ter um ancestral como o Material ou Sccafold para funcionar
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        children: <Widget>[
          Image.asset(
            'assets/images/logo.png',
            width: 100,
            height: 100,
          ),
          TextField(decoration: InputDecoration(labelText: "E-mail")),
          TextField(decoration: InputDecoration(labelText: "Senha")),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: RaisedButton(
                child: const Text("Entrar"),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      'initialscreen'); //Como foram definidas no main rotas nomeadas, é só chamar pelo nome que está lá
                }),
          ),
          RaisedButton(child: const Text("Cadastrar"), onPressed: () {})
        ],
      ),
    );
  }
}
