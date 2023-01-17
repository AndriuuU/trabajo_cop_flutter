import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/users.dart';
import '../services/services.dart';

class PedidosScreen extends StatefulWidget {
  PedidosScreen({Key? key}) : super(key: key);

  @override
  State<PedidosScreen> createState() => _PedidosScreenState();
}

class _PedidosScreenState extends State<PedidosScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Text('Pedido $index'),
            );
          },
        ),
      ),
    );
  }
}
