import 'package:flutter/material.dart';
import 'package:minhas_compras/widgets/mainDrawer.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Configs"),
      ),
    );
  }
}
