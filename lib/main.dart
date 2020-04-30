import 'package:flutter/material.dart';
import 'package:minhas_compras/views/telaApresentacao.dart';

void main() {
  runApp(PrimeiraTela());
}

class PrimeiraTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaApresentacao(),
    );
  }
}
