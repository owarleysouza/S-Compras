import 'package:flutter/material.dart';
import 'package:minhas_compras/models/compra.dart';
import 'package:minhas_compras/providers/auth_provider.dart';
import 'package:minhas_compras/views/auth_screen.dart';
import 'package:minhas_compras/views/products_list_overview_screen.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AuthOrProductScreen extends StatelessWidget {
  Compra compra;
  String token;
  String userId;

  AuthOrProductScreen({this.compra, this.token, this.userId});

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of(context);
    return auth.isAuth
        ? Produtos(
            compra: compra,
            token: token,
            userId: userId,
          )
        : Auth();
  }
}
