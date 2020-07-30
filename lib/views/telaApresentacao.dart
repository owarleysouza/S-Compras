import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:minhas_compras/utils/routes.dart';

//Tela de Apresentacao onde serão mostradas as funcionalidades do app
class TelaApresentacao extends StatefulWidget {
  @override
  _TelaApresentacaoState createState() => _TelaApresentacaoState();
}

class _TelaApresentacaoState extends State<TelaApresentacao> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(height: 400.0),
            items: [
              [
                "assets/images/logo.png",
                "Faça suas compras de forma simples e prática",
              ],
              [
                "assets/images/add.png",
                "Crie uma compra e adicione produtos nela",
              ],
              [
                "assets/images/Frios.png",
                "Divida os produtos das suas compras em categorias:  'Grosso', 'Limpeza e Higiene (LEH)' e 'Frios'",
              ]
            ].map((i) {
              String img = i[0];
              String text = i[1];
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Color(0xF264653),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset(
                            img,
                            width: 100,
                            height: 100,
                          ),
                          Text(
                            text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ));
                },
              );
            }).toList(),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: RaisedButton(
                child: const Text("Avançar"),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes
                      .login); //Como foram definidas no main rotas nomeadas, é só chamar pelo nome que está lá
                }),
          )
        ],
      ),
    );
  }
}
