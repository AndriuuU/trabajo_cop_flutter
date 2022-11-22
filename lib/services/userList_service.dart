import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../models/users.dart';
import 'auth_service.dart';
import 'package:http/http.dart' as http;

class UsersListService extends ChangeNotifier {
  final String _baseUrl = 'salesin.allsites.es';
  final List<DataUser> users = [];

  UsersListService() {
    loadAllUsers();
  }

  Future loadAllUsers() async {
    final url = Uri.http(_baseUrl, '/public/api/users');
    String? token = await AuthService().getToken();
    final resp = await http.get(url, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token'
    });

    final Map<String, dynamic> usersMap = json.decode(resp.body);
    usersMap.forEach((key, value) {
      if (key == "data") {
        final List<dynamic> usersMapAux = value;
        for (int i = 0; i < usersMapAux.length; i++) {
          final tempUser = DataUser.fromMap(usersMapAux[i]);

          users.add(tempUser);
        }
      }
    });

    return users;
  }
}
