// import 'package:flutter/material.dart';
// import '../models/models.dart';
// import '../services/services.dart';

// class EditScreen extends StatelessWidget {
//   final User users;
//   const EditScreen({Key? key, required this.users}) : super(key: key);
//   @override
//   _EditUser createState() => _EditUser();

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

// class _EditUser extends State<EditScreen> {
//   void editUser(
//       {User users, String email, String password, String name}) async {
//     final response = await http.put(
//         Uri.parse(
//           "http://10.0.2.2:1337/apis/${users.id}",
//         ),
//         headers: <String, String>{
//           'Context-Type': 'application/json;charset=UTF-8',
//         },
//         body: <String, String>{
//           'name': name,
//           'email': email,
//           'password': password,
//         });
//     Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (BuildContext context) => DisplayUsers()),
//         (Route<dynamic> route) => false);
//   }
// }
