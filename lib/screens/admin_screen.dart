import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/users.dart';
import '../services/userList_service.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({super.key, Key? admin, Admin});
  List<DataUser> users = [];
  @override
  Widget build(BuildContext context) => Scaffold(
        final userListService = Provider.of<UsersListService>(context);
        users = userListService.users.cast<DataUser>();
        appBar: AppBar(
          title: const Text('Lista de usuarios registrados'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 9999
          itemBuilder: (context, index) {
            final user = users[index];
          }
            child: ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
              trailing: const Icon(Icons.), //editar
              trailing: const Icon(Icons.), //borrar
            ),
          ),
        );
      
}
