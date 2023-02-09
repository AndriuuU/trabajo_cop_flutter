import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trabajo_cop_flutter/models/models.dart';
import 'package:http/http.dart' as http;

import '../models/Productos_model.dart';

import '../screens/add_pedidos_screen.dart';
import 'services.dart';

class BuscarCatalogoService extends ChangeNotifier {
    
    final String _baseUrl='semillero.allsites.es';
     bool isLoading = true;
    BuscarCatalogoService() {
      
      this.getCatalogo();
    }

    List<Datum> listPedidos=[];

  
    
    getCatalogo() async {
      
      String token = await AuthService().readToken();
      AddPedidosScreen1 sa=new AddPedidosScreen1();
      int? company_id= sa.cicleId;
      if(company_id!=null){

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
        isLoading=false;
      // }
      //print(listciclos);
     
      notifyListeners();
      }else
      print("Es nulo");
    }
    
}
