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
      theme: ThemeData(
          primarySwatch: Colors
              .blueGrey, //Cor primária do app que vai definir a cor de elementos principais, como a appbar, e etc
          accentColor: Colors
              .deepOrange, //Cor definida para os elementos de destaque no app, como botões e etc
          fontFamily: 'Montserrat',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.w700))),
          textTheme: ThemeData.light().textTheme.copyWith(
              //Propriedade para definir o estilo de textos do app, assim com um 'style: Theme.of(context).textTheme.headline6' em um texto o estilo é adicionado
              headline6: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight
                      .w500))), //Elemento que define a fonte principal do app. É como em css que vc pode definir estilos gerais, e estilos específicos. Esse é geral
    );
  }
}
