import 'package:flutter/material.dart';
import 'package:minhas_compras/providers/auth_provider.dart';
import 'package:minhas_compras/utils/routes.dart';
import 'package:provider/provider.dart';

enum AuthMode { Signup, Login }

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _form = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  bool _isLoading = false;
  final _passwordController = TextEditingController();
  final Map<String, String> _authData = {'email': '', 'password': ''};

  Future<void> _submit() async {
    if (!_form.currentState.validate()) {
      return null;
    }

    setState(() {
      _isLoading = true;
    });

    _form.currentState.save();

    AuthProvider auth = Provider.of(context, listen: false);
    if (_authMode == AuthMode.Login) {
      //Login
    } else {
      await auth.signup(_authData['email'], _authData['password']);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _switchMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

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
                key: _form,
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
                        onSaved: (newValue) =>
                            _authData['password'] = newValue),
                    if (_authMode == AuthMode.Signup)
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Confirmar Senha'),
                        obscureText: true,
                        validator: _authMode == AuthMode.Signup
                            ? (value) {
                                if (value != _passwordController.text) {
                                  return "Senhas diferentes";
                                }
                                return null;
                              }
                            : null,
                      )
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            _isLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  )
                : RaisedButton(
                    child:
                        Text(_authMode == AuthMode.Login ? "Entrar" : "Criar"),
                    onPressed: _submit),
            FlatButton(
                onPressed: _switchMode,
                child: Text(_authMode == AuthMode.Login
                    ? "Ainda não tem uma conta? Crie aqui."
                    : "Já tem uma conta? Entre aqui."))
          ],
        ),
      ),
    );
  }
}
