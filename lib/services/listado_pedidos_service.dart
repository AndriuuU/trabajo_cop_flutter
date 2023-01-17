import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trabajo_cop_flutter/models/listaPedidos_models.dart';
import 'package:trabajo_cop_flutter/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:trabajo_cop_flutter/models/pedidos_response.dart';

import '../models/pedidos_models.dart';
import 'auth_service.dart';

class GetListPedidos extends ChangeNotifier {

  
   final String _baseUrl='semillero.allsites.es';
  
    GetPedidos() {
      
      this.getListPedidos();
    }

    List<Trace> listPedidos=[];
    
    getListPedidos() async {
      String token = await AuthService().readToken();

      final url=Uri.http(_baseUrl,'/public/api/ordes');
      final resp = await http.get(url,
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer $token"
        });
      var decodeResp = ListaPedidosComposer.fromJson(resp.body);
  
      // for(int a=0;a<decodeResp.data.length;a++){
        listPedidos=decodeResp.trace;
        print(listPedidos);
      // }
      //print(listciclos);
     
      notifyListeners();
    }
    
}