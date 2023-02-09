import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trabajo_cop_flutter/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:trabajo_cop_flutter/models/orders_models.dart';

import '../models/Productos_model.dart';

import 'services.dart';

class OrderService extends ChangeNotifier {
    
    final String _baseUrl='semillero.allsites.es';
  
    OrderService() {
      
      this.getOrders();
    }

    List<Datum2> listOrders=[];
    
    getOrders() async {
      String token = await AuthService().readToken();
      String company_id= await UsersListService().readCompany_id();
      print(company_id);
     
      final url=Uri.http(_baseUrl,'/public/api/orders/company');
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
      
      
      var decodeResp = Orders.fromJson(resp.body);

        print(decodeResp.data);
      // for(int a=0;a<decodeResp.data.length;a++){
        listOrders=decodeResp.data;
        
      // }
      //print(listciclos);
     
      notifyListeners();
    }
    
}
