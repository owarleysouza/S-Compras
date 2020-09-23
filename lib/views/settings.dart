import 'package:flutter/material.dart';
import 'package:minhas_compras/providers/auth_provider.dart';
import 'package:minhas_compras/widgets/mainDrawer.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String userEmail = Provider.of<AuthProvider>(context).userEmail;
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      drawer: MainDrawer(
        userEmail: userEmail,
      ),
      body: Center(
        child: Text("Configs"),
      ),
    );
  }
}
