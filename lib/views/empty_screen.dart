import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  final String texto;

  EmptyScreen({@required this.texto});

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
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(texto),
            )
          ],
        ),
      ),
    );
  }
}
