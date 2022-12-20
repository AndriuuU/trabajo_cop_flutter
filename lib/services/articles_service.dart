import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/articles_models.dart';
import '../models/articles_response.dart';

class articulosService extends ChangeNotifier {
  final String _baseUrl = 'semillero.allsites.es';

  GetArticulos() {
    this.getListArticulos();
  }

  List<Articles> listArticulos = [];

  getListArticulos() async {
    final url = Uri.http(_baseUrl, '/public/api/cicles');
    final resp = await http.get(url);
    var decodeResp = ArticlesResponse.fromJson(resp.body);

    // for(int a=0;a<decodeResp.data.length;a++){
    listArticulos = decodeResp.data;

    // }
    //print(listciclos);

    notifyListeners();
  }
}
