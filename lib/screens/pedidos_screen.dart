import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabajo_cop_flutter/models/pedidos_models.dart';
import 'package:trabajo_cop_flutter/services/pedidos_service.dart';
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
    final getPedidos = Provider.of<GetPedidos>(context);
    List<Pedidos> listPedidos = getPedidos.listPedidos;

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
