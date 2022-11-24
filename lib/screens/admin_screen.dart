import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/users.dart';
import '../services/services.dart';

class AdminScreen extends StatefulWidget {
  AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<DataUser> users = [];

  @override
  Widget build(BuildContext context) {
    final userListService = Provider.of<UsersListService>(context);
    users = userListService.users.cast<DataUser>();

    return MaterialApp(
        // debugShowCheckedModeBanner:false;
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuarios registrados'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  users.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    ));
  }
}
