// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   String email;
//   String password;
//   bool spinner = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login'),),
//       body: Builder(
//         builder: (context) => ModalProgressHUD(
//           inAsyncCall: spinner,
//           child: ListView(
//             padding: EdgeInsets.all(25),
//             children: [
//               //------------------------------------
//               TextField(
//                 onChanged: (val) {
//                   email = val;
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'enter your email',
//                   labelText: 'email',
//                 ),
//               ),
//               //-----------------------------------
//               TextField(
//                 onChanged: (val) {
//                   password = val;
//                 },
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'enter your password',
//                   labelText: 'password',
//                 ),
//               ),
//               //-----------------------------------
//               SizedBox(
//                 height: 50,
//               ),
//               FlatButton(
//                   color: Colors.teal,
//                   onPressed: () async {
//                     setState(() {
//                       spinner=true;
//                     });
//                     http.Response response = await http.post(
//                       'https://radiant-tundra-31777.herokuapp.com/login',
//                       headers: <String, String>{
//                         'Content-Type': 'application/json; charset=UTF-8',
//                       },
//                       body: jsonEncode(<String, String>{
//                         'email': email,
//                         'password': password,
//                       }),
//                     );
//                     setState(() {
//                       spinner=false;
//                     });
//                     //-----------------------------------------
//                     if (response.body == 'email does not exist') {
//                       Scaffold.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text(
//                             'email not existed',
//                           ),
//                           duration: Duration(seconds: 3),
//                         ),
//                       );
//                     } else if (response.body == 'password not valid') {
//                       Scaffold.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text(
//                             'password incorrect',
//                           ),
//                           duration: Duration(seconds: 3),
//                         ),
//                       );
//                     }else{
//                       Scaffold.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text(
//                             'logged in successfully',
//                           ),
//                           duration: Duration(seconds: 3),
//                         ),
//                       );
//                     }
//                   },
//                   child: Text(
//                     'login',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
