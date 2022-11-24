import 'package:flutter/material.dart';
import 'package:trabajo_cop_flutter/models/models.dart';
import 'package:http/http.dart' as http;

class GetCiclos extends ChangeNotifier {
    
    
    
    final String _baseUrl='salesin.allsites.es';
    

    GetCiclos() {
      print('Inicializando ciclos');
      this.getListCicles();
    }

    List<Ciclos> listciclos=[];
    
    getListCicles() async {
      
      print('Inicializado ciclos');
      
      final url=Uri.http(_baseUrl,'/public/api/cicles');
      
      final resp= await http.get(url);
      final decodeResp = CiclesResponse.fromJson(resp.body);
      
      // for(int a=0;a<decodeResp.data.length;a++){
      listciclos=decodeResp.data;
      // }
      //print(listciclos);
      listciclos.cast<List<Ciclos>>();
      notifyListeners();
    }
}