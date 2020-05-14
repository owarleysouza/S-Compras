import 'package:flutter/material.dart';
import 'package:minhas_compras/views/telaInicial.dart';

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
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              width: 100,
              height: 100,
            ),
            TextField(decoration: InputDecoration(labelText: "E-mail")),
            TextField(decoration: InputDecoration(labelText: "Senha")),
            RaisedButton(
                child: Text("Entrar"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaInicial()));
                }),
            RaisedButton(child: Text("Cadastrar"), onPressed: null)
          ],
        ),
      ),
    );
  }
}
