import 'package:flutter/material.dart';

class TelaVazia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("Ainda nenhum produto! :(")],
        ),
      ),
    );
  }
}
