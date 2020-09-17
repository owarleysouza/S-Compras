import 'package:flutter/material.dart';
import 'package:minhas_compras/providers/auth_provider.dart';
import 'package:minhas_compras/views/auth_screen.dart';
import 'package:minhas_compras/views/initial_screen.dart';
import 'package:provider/provider.dart';

class AuthOrHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of(context);
    return auth.isAuth ? InitialScreen() : Auth();
  }
}
