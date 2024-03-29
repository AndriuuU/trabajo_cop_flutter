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
      String company_id= await UsersListService().readCompany_id();
      print(company_id);
      // final ContrainsCiclos contra=ContrainsCiclos();
      // String id=contra.cicleId.toString();
      final url=Uri.http(_baseUrl,'/public/api/products/company');
      final Map<String, dynamic> catalogData = {
        'id': company_id,
      };

      final resp = await http.post(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer $token"
        },
        body: json.encode(catalogData),
      );
      
      
      var decodeResp = Pedidos.fromJson(resp.body);

        print(decodeResp.data);
      // for(int a=0;a<decodeResp.data.length;a++){
        listPedidos=decodeResp.data;
        
      // }
      //print(listciclos);
     
      notifyListeners();
    }
    
}
