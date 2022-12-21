import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trabajo_cop_flutter/models/models.dart';
import 'package:http/http.dart' as http;

class GetCiclos extends ChangeNotifier {
    
    final String _baseUrl='semillero.allsites.es';
  
    GetCiclos() {
      
      this.getListCicles();
    }

    List<Ciclos> listciclos=[];
    
    getListCicles() async {
      
      final url=Uri.http(_baseUrl,'/public/api/companies');
      final resp= await http.get(url);
      var decodeResp = CiclesResponse.fromJson(resp.body);
  
      // for(int a=0;a<decodeResp.data.length;a++){
        listciclos=decodeResp.data;
        
      // }
      //print(listciclos);
     
      notifyListeners();
    }
    
}

