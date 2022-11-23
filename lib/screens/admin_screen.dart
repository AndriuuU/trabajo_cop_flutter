import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/users.dart';
import '../services/services.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({Key? key}) : super(key: key);
  List<DataUser> users = [];
  

  //void deleteUser()async{
   //         await http.delete(Uri.parse("http://10.0.2.2:1337/apis/${widget.users.id}"));
   //        Navigator.of(context).pushAndRemoveUntil(
   //             MaterialPageRoute(builder: (BuildContext context) => DisplayUsers()),
    //            (Route<dynamic> route) => false);
    //      }

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
              trailing: const IconButton(
                onPressed: () => Navigator.pushReplacementNamed(context, 'edit');
                icon: Icon(Icons.edit) 
              ),
              trailing: const IconButton(
                onPressed: () => Navigator.pushReplacementNamed(context, 'admin');
                icon: Icon(Icons.delete) 
              ),
            ),
          ),
        );
      
}
