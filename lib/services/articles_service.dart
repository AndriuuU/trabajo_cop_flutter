import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/articles_models.dart';
import '../models/articles_response.dart';
import 'auth_service.dart';

class articulosService extends ChangeNotifier {
  final String _baseUrl = 'semillero.allsites.es';
  
  // List<Articles> listArticulos = [];
  

  GetArticulos() {
     

    this.getListArticulos();
  }

  List<Articles> listArticulos = [];

  getListArticulos() async {
    String token = await AuthService().readToken();
    
    final url = Uri.http(_baseUrl, '/public/api/articles');
    final resp = await http.get(url,
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer $token"
        });
    //final Map<String, dynamic> decodedResp = json.decode(resp.body);
    var a = ArticlesResponse.fromJson(resp.body);
    
    // for(int a=0;a<decodeResp.data.length;a++){
    listArticulos = a.data;
    // print(listArticulos);
    
    // }
    //print(listciclos);
    
    notifyListeners();
    // return listArticulos;
  }
}
