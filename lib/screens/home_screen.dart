import 'package:flutter/material.dart';
import 'package:trabajo_cop_flutter/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'catalogo');
              },
              child: Text('Catálogo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'pedidos');
              },
              child: Text('Pedidos'),
            ),
          ],
        ),
      ),
    );
  }
}
