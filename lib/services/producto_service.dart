import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trabajo_cop_flutter/models/models.dart';
import 'package:http/http.dart' as http;

import '../models/Productos_model.dart';

import 'services.dart';

class ProductoService extends ChangeNotifier {
    
    final String _baseUrl='semillero.allsites.es';
  
    ProductoService() {
      
      this.getProcuto();
    }

    List<Datum> listPedidos=[];
    
    getProcuto() async {
      String token = await AuthService().readToken();
      // final ContrainsCiclos contra=ContrainsCiclos();
      // String id=contra.cicleId.toString();
      final url=Uri.http(_baseUrl,'/public/api/products/company?id=3');
      final resp= await http.post(url,
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer $token"
        });
    
      print(resp.body);
      var decodeResp = Pedidos.fromJson(resp.body);
  
      // for(int a=0;a<decodeResp.data.length;a++){
        listPedidos=decodeResp.data;
        
      // }
      //print(listciclos);
     
      notifyListeners();
    }
    
}
