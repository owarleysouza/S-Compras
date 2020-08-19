import 'package:flutter/material.dart';

import 'package:minhas_compras/widgets/mainDrawer.dart';

import 'package:minhas_compras/views/complete_shops_screen.dart';
import 'package:minhas_compras/views/shops_list_overview_screen.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int _selectedScreenIndex = 0;
  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      ShoppingListOverviewScreen(),
      ComprasConcluidas()
    ];

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: const Text("Compras"),
        centerTitle: true,
      ),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedScreenIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                title: Text("Compras Atuais")),
            BottomNavigationBarItem(
                icon: Icon(Icons.check_circle),
                title: Text("Compras Realizadas"))
          ]),
    );
  }
}