import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class AuthService extends ChangeNotifier {
  final String _baseUrl = 'semillero.allsites.es';
  final storage = FlutterSecureStorage();
  //final String _firebaseToken='';

  
  
  Future<String?> createUser(String name, String surname, String email,
      String password, String c_password,int cicle_id) async {
    final Map<String, dynamic> authData = {
      'firstname': name,
      'secondname': surname,
      'email': email,
      'password': password,
      'c_password': c_password,
      'company_id': cicle_id,
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
      await storage.write(key: 'token', value: decodeResp['data']['token']);
      await storage.write(key: 'id', value: decodeResp['data']['id'].toString());
      // print(decodeResp['data']['token']);
      return decodeResp['data']['type'];
    } else {
      return null;
    }
  }

  // Future<List<Ciclos>?> getCicles() async {
  //   List<Ciclos> listciclos = [];
  //   final url = Uri.http(_baseUrl, '/public/api/cicles', {});

  //   final resp = await http.get(url);
  //   final decodeResp = CiclesResponse.fromJson(resp.body);

  //   for (int a = 0; a < decodeResp.data.length; a++) {
  //     listciclos.add(decodeResp.data[a]);
  //   }
  // }

  // Future<String> getToken() async {
  //   return await storage.read(key: 'token') ?? '';
   

    // if(decodeResp.containsValue(true)){

    //   return decodeResp['data']['id'];

    // }else{

    //   return null;
    // }
  // }

  Future<String> readToken() async {
    
    return await storage.read(key: 'token') ?? '';
    
  }
  Future<String> readId() async {
    
    return await storage.read(key: 'id') ?? '';
    
  }
}
 

