import 'package:flutter/material.dart';
import 'package:minhas_compras/providers/auth_provider.dart';
import 'package:minhas_compras/utils/routes.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  final String userEmail;

  MainDrawer({@required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              userEmail != null ? userEmail : "Olá",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Tela Inicial"),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(AppRoutes.initial_screen),
          ),
          ListTile(
            leading: const Icon(Icons.add_to_home_screen),
            title: const Text("Compartilhar Compra"),
          ),
          Divider(),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.settings)),
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: () =>
                  Provider.of<AuthProvider>(context, listen: false).logout()),
        ],
      ),
    );
  }
}
