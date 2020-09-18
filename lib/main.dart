import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minhas_compras/providers/auth_provider.dart';
import 'package:minhas_compras/providers/shops_provider.dart';
import 'package:minhas_compras/utils/routes.dart';
import 'package:minhas_compras/views/auth_home_screen.dart';
import 'package:minhas_compras/views/initial_screen.dart';
import 'package:minhas_compras/views/auth_screen.dart';
import 'package:minhas_compras/views/settings.dart';
import 'package:provider/provider.dart';

//Arquivo principal que usa o RunApp para chamar a classe principal e executar o app

void main() {
  runApp(MyApp());
}

/* Classe Principal que inicia o app. Ela deve utilizar o 'MaterialApp' como widget raiz da arvore, 
e assim chamar na home dele outra classe. Nesse caso é a TelaApresentacao, que é a tela inicial do app.
Resolvi tirar a página principal do main para organizar melhor em outra tela.*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new AuthProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, ShopProvider>(
          create: (_) => new ShopProvider(null, []),
          update: (context, auth, previousShops) =>
              new ShopProvider(auth.token, previousShops.items),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(
              0xFF14213D), //Cor primária do app que vai definir a cor de elementos principais, como a appbar, e etc
          accentColor: Color(
              0xFFFCA311), //Cor definida para os elementos de destaque no app, como botões e etc
          buttonColor: Color(0xFFFCA311),
          fontFamily: 'Montserrat',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.w700))),
        ),
        home: AuthOrHomeScreen(),
        routes: {
          //Usando rotas nomeadas, assim nas paginas que precisam dessas rotas é só chamar o navigator com pushedname
          AppRoutes.login: (context) => Auth(),
          AppRoutes.initial_screen: (context) => InitialScreen(),
          AppRoutes.settings: (context) => Settings()
        },
      ),
    );
  }
}
