import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trabajo_cop_flutter/models/user_data_models.dart';
import '../models/users.dart';
import 'auth_service.dart';
import 'package:http/http.dart' as http;

class UsersListService extends ChangeNotifier {
final storage = FlutterSecureStorage();
final String _baseUrl='semillero.allsites.es';
  
    UsersListService() {
      
      // this.getListUsers();
      this.getDataUser();
    }

    // List<DataUser> listUsers=[];
    
    // getListUsers() async {
    //   String token = await AuthService().readToken();

    //   final url = Uri.http(_baseUrl, '/public/api/users');
    //    final resp = await http.get(url,
    //     headers: {
    //       'Accept': 'application/json',
    //       "Authorization": "Bearer $token"
    //     });

    //   var decodeResp = User.fromJson(resp.body);
  
    //   listUsers=decodeResp.data;
     
    //   notifyListeners();
    // }

    
    getDataUser() async {
      String token = await AuthService().readToken();
      String id = await AuthService().readId();
     
      final url = Uri.http(_baseUrl, '/public/api/user/$id');
      final resp = await http.get(url,
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer $token"
        });
      
      var decodeResp = UserData.fromJson(resp.body);
      final Map<String, dynamic> decodeRespCompany = json.decode(resp.body);
      
      await storage.write(key: 'company_id', value: decodeRespCompany['data']['company_id'].toString());
      
      ListDataUsers=decodeResp.data;
      
      notifyListeners();
    }
    Data? ListDataUsers;

  

  // final String _baseUrl = 'salesin.allsites.es';
  

  // UsersListService() {
  //   this.loadAllUsers();
  // }
  // final List<DataUser> users = [];

  // Future loadAllUsers() async {
  //   final url = Uri.http(_baseUrl, '/public/api/users');
  //   String? token = await AuthService().getToken();
  //   final resp = await http.get(url, headers: {
  //     HttpHeaders.acceptHeader: 'application/json',
  //     HttpHeaders.authorizationHeader: 'Bearer $token'
  //   });

  //   final Map<String, dynamic> usersMap = json.decode(resp.body);
  //   usersMap.forEach((key, value) {
  //     if (key == "data") {
  //       final List<dynamic> usersMapAux = value;
  //       for (int i = 0; i < usersMapAux.length; i++) {
  //         final tempUser = DataUser.fromMap(usersMapAux[i]);

  //         users.add(tempUser);
  //       }
  //     }
  //   });

  //   return users;
  // }
  Future<String> readCompany_id() async {
    
    return await storage.read(key: 'company_id') ?? '';
    
  }
}
