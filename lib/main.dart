import 'package:flutter/material.dart';
import 'package:minhas_compras/views/telaApresentacao.dart';

//Arquivo principal que usa o RunApp para chamar a classe principal e executar o app

void main() {
  runApp(PrimeiraTela());
}

/* Classe Principal que inicia o app. Ela deve utilizar o 'MaterialApp' como widget raiz da arvore, 
e assim chamar na home dele outra classe. Nesse caso é a TelaApresentacao, que é a tela inicial do app.
Resolvi tirar a página principal do main para organizar melhor em outra tela.*/
class PrimeiraTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaApresentacao(),
    );
  }
}
