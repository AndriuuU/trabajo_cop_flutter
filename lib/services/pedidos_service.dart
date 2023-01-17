import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/pedidos_models.dart';
import '../models/pedidos_response.dart';
import 'auth_service.dart';

class GetPedidos extends ChangeNotifier {
  final String _baseUrl = 'semillero.allsites.es';

  GetPedidos() {
    this.getListPedidos();
  }

  List<Pedidos> listPedidos = [];

  getListPedidos() async {
    String token = await AuthService().readToken();

    final url = Uri.http(_baseUrl, '/public/api/orders');
    final resp = await http.get(url, headers: {
      'Accept': 'application/json',
      "Authorization": "Bearer $token"
    });
    //final Map<String, dynamic> decodedResp = json.decode(resp.body);
    var a = PedidosResponse.fromJson(resp.body);

    // for(int a=0;a<decodeResp.data.length;a++){
    listPedidos = a.data;
    // print(listPedidos);

    // }
    //print(listciclos);

    notifyListeners();
    // return listPedidos;
  }
}
