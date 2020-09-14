import 'package:flutter/material.dart';
import 'package:minhas_compras/utils/routes.dart';

enum AuthMode { Signup, Login }

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthMode _authMode = AuthMode.Login;
  final _passwordController = TextEditingController();
  final Map<String, String> _authData = {'email': '', 'password': ''};

  void _submit() {}

  @override
  Widget build(BuildContext context) {
    return Material(
      //Aqui é usado o Material porque o TextField precisa ter um ancestral como o Material ou Sccafold para funcionar
      child: Container(
        //color: Theme.of(context).primaryColor,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
            ),
            Form(
                child: Column(
              children: [
                TextFormField(
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty || !value.contains("@")) {
                        return "Informe um e-mail válido";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) => _authData['email'] = newValue),
                TextFormField(
                    decoration: InputDecoration(labelText: 'Senha'),
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return "Informe uma senha válida";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) => _authData['password'] = newValue),
                if (_authMode == AuthMode.Signup)
                  TextFormField(
                      decoration: InputDecoration(labelText: 'Confirmar Senha'),
                      controller: _passwordController,
                      obscureText: true,
                      validator: _authMode == AuthMode.Signup
                          ? (value) {
                              if (value != _passwordController.text) {
                                return "Senhas diferentes";
                              }
                              return null;
                            }
                          : null,
                      onSaved: (newValue) => _authData['password'] = newValue)
              ],
            )),
            SizedBox(height: 10),
            RaisedButton(
                child:
                    Text(_authMode == AuthMode.Login ? "Entrar" : "Registrar"),
                onPressed: _submit)
          ],
        ),
      ),
    );
  }
}
