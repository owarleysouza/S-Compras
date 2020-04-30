import 'package:flutter/material.dart';

class TelaApresentacao extends StatefulWidget {
  @override
  _TelaApresentacaoState createState() => _TelaApresentacaoState();
}

class _TelaApresentacaoState extends State<TelaApresentacao> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Center(
              child: Text(
            "Tela Apresentacao",
            style: TextStyle(color: Colors.blueGrey),
          ))),
    );
  }
}
