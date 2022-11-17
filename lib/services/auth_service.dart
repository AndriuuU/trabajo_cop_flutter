import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier{
  final String _baseUrl='salesin.allsites.es';
  //final String _firebaseToken='';

  Future<String?> createUser(String name,String surname,String email, String password, String c_password) async {
    
    final Map<String, dynamic> authData = {
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
      'c_password': c_password,
      'cicle_id' : 1,
    };

    final url=Uri.http(_baseUrl,'/public/api/register',{});
    
    final resp= await http.post(url,headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Some token"
        },
        body: json.encode(authData));

    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if(decodeResp.containsKey('idToken')){
      
      return null;
    }else{
      
      return decodeResp['error']['message'];
    }

    
  }

  Future<String?> login(String email, String password) async {
    
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };

    final url=Uri.http(_baseUrl,'/public/api/login',{});
    
    final resp= await http.post(url,headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Some token"
        },
        body: json.encode(authData));

    final Map<String, dynamic> decodeResp = json.decode(resp.body);
    if(decodeResp.containsValue(true)){
      
      return decodeResp['data']['type'];
      

    }else{
      
      return null;
    }
    
    
  }
}