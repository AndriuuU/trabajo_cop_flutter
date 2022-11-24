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
  Widget build(BuildContext context) {
        
        final userListService = Provider.of<UsersListService>(context);
        users = userListService.users.cast<DataUser>();

        return MaterialApp(
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
              trailing: 
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => {Navigator.pushReplacementNamed(context, 'edit')},
                ), 
                
                // trailing: IconButton(
                //     icon: const Icon(Icons.delete),
                //     onPressed: () => {Navigator.pushReplacementNamed(context, 'admin')},
                    
                //   ),
                  
              );
            },
            ),
          )
        );

  }
}

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}
