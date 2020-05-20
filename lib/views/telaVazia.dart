import 'package:flutter/material.dart';

class TelaVazia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/add.png',
              width: 100,
              height: 100,
            ),
            Text("Ainda nenhum produto! :(")
          ],
        ),
      ),
    );
  }
}
