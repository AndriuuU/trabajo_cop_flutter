import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trabajo_cop_flutter/models/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'salesin.allsites.es';
  final storage = FlutterSecureStorage();
  //final String _firebaseToken='';

  Future<String?> createUser(String name, String surname, String email,
      String password, String c_password) async {
    final Map<String, dynamic> authData = {
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
      'c_password': c_password,
      'cicle_id': 1,
    };

    final url = Uri.http(_baseUrl, '/public/api/register', {});

    final resp = await http.post(url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Some token"
        },
        body: json.encode(authData));

    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey(true)) {
      return null;
    } else {
      return decodeResp['message'];
    }
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };

    final url = Uri.http(_baseUrl, '/public/api/login', {});

    final resp = await http.post(url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Some token"
        },
        body: json.encode(authData));

    final Map<String, dynamic> decodeResp = json.decode(resp.body);
    if (decodeResp.containsValue(true)) {
      return decodeResp['data']['type'];
    } else {
      return null;
    }
  }

  Future<List<Ciclos>?> getCicles() async {
    List<Ciclos> listciclos = [];
    final url = Uri.http(_baseUrl, '/public/api/cicles', {});

    final resp = await http.get(url);
    final decodeResp = CiclesResponse.fromJson(resp.body);

    for (int a = 0; a < decodeResp.data.length; a++) {
      listciclos.add(decodeResp.data[a]);
    }
  }

  Future<String> getToken() async {
    return await storage.read(key: 'token') ?? '';
    notifyListeners();

    // if(decodeResp.containsValue(true)){

    //   return decodeResp['data']['id'];

    // }else{

    //   return null;
    // }
  }
}

class GetCiclos extends ChangeNotifier {

    final String _baseUrl='salesin.allsites.es';
    List<Ciclos> listciclos=[];

    GetCiclos() {
      print('Inicializando ciclos');
      this.getListCicles();
    }
    
    getListCicles() async {
      print('Inicializado ciclos');
      
      final url=Uri.http(_baseUrl,'/public/api/cicles');
      
      final resp= await http.get(url);
      final decodeResp = CiclesResponse.fromJson(resp.body);
      
      // for(int a=0;a<decodeResp.data.length;a++){
        listciclos=decodeResp.data;
      // }
      //print(listciclos);
      
      notifyListeners();
    }
}
