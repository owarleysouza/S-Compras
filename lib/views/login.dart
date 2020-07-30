import 'package:flutter/material.dart';
import 'package:minhas_compras/utils/routes.dart';

//Tela de Login do app
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontroller = TextEditingController();
  final senhacontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      //Aqui é usado o Material porque o TextField precisa ter um ancestral como o Material ou Sccafold para funcionar
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(color: Colors.white38)),
              controller: emailcontroller,
            ),
            TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.white38)),
                controller: senhacontroller),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: RaisedButton(
                  child: const Text("Entrar"),
                  onPressed: () {
                    if (emailcontroller.text == "warley@gmail.com" &&
                        senhacontroller.text == "123123") {
                      Navigator.of(context).pushNamed(AppRoutes.initial_screen);
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Erro"),
                              content: Text("Login e/ou Senha Inválido(s)"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"))
                              ],
                            );
                          });
                    }
                    //Como foram definidas no main rotas nomeadas, é só chamar pelo nome que está lá
                  }),
            ),
            RaisedButton(child: const Text("Cadastrar"), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
