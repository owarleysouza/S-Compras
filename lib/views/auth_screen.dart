import 'package:flutter/material.dart';
import 'package:minhas_compras/exceptions/auth_exception.dart';
import 'package:minhas_compras/providers/auth_provider.dart';
import 'package:provider/provider.dart';

enum AuthMode { Signup, Login }

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  GlobalKey<FormState> _form = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  bool _isLoading = false;
  final _passwordController = TextEditingController();
  final Map<String, String> _authData = {'email': '', 'password': ''};

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Ocorreu um erro!"),
        content: Text(msg),
        actions: [
          FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Fechar"))
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_form.currentState.validate()) {
      return null;
    }

    setState(() {
      _isLoading = true;
    });

    _form.currentState.save();

    AuthProvider auth = Provider.of(context, listen: false);

    try {
      if (_authMode == AuthMode.Login) {
        await auth.login(_authData['email'], _authData['password']);
      } else {
        await auth.signup(_authData['email'], _authData['password']);
      }
    } on AuthException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      _showErrorDialog("Ocorreu um erro inesperado!");
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
                child: _authMode == AuthMode.Login
                    ? Text.rich(
                        TextSpan(
                          text: 'Ainda não tem uma conta? ',
                          style: TextStyle(fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Crie aqui.',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                )),
                            // can add more TextSpans here...
                          ],
                        ),
                      )
                    : Text.rich(
                        TextSpan(
                          text: 'Já tem uma conta? ',
                          style: TextStyle(fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Entre aqui.',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                )),
                            // can add more TextSpans here...
                          ],
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
