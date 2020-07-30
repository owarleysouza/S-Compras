import 'package:flutter/material.dart';
import 'package:minhas_compras/utils/routes.dart';

class MainDrawer extends StatelessWidget {
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
              'User',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Tela Inicial"),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('initialscreen'),
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
        ],
      ),
    );
  }
}
