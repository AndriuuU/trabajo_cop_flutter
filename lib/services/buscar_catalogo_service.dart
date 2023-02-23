import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trabajo_cop_flutter/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:trabajo_cop_flutter/models/orders_models.dart';
import 'package:trabajo_cop_flutter/screens/admin_grafica_screen.dart';

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
      print('Entra en el metodo');
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
    

    List<Datum2> listPedidos2=[];
  
    getCatalogo2() async {
      
      String token = await AuthService().readToken();
      print('Tiene el token: '+token);
      adminGrafica sa=new adminGrafica();
      int? company_id= sa.reacompany_id();
      
      print('Ha entrado ');
      // if(company_id!=null){

        print(company_id);
        // final ContrainsCiclos contra=ContrainsCiclos();
        // String id=contra.cicleId.toString();
        final url=Uri.http(_baseUrl,'/public/api/orders/company');
        final Map<String, dynamic> catalogData = {
          'id': 1,
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
          listPedidos2=decodeResp.data;
          isLoading=false;
        // }
        //print(listciclos);
      
        notifyListeners();

      // }else
        // print("Es nulo");
    }
}
