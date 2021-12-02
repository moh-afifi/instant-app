// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'list_card.dart';
//
// class Api extends StatefulWidget {
//   @override
//   _ApiState createState() => _ApiState();
// }
//
// class _ApiState extends State<Api> {
//   //-----------------------------------------
//   List<Widget> myList = [];
//   getApi() async {
//     String url = 'https://jsonplaceholder.typicode.com/posts';
//     var res = await http.get(url);
//     var body = jsonDecode(res.body);
//     for (int i = 0; i < body.length; i++) {
//       String myTitle = body[i]['title'];
//       String myBody = body[i]['body'];
//       var item = ListCard(
//         title: myTitle,
//         body: myBody,
//       );
//       myList.add(item);
//     }
//     setState(() {});
//   }
//
//   //-----------------------------------------
//   @override
//   void initState() {
//     getApi();
//     super.initState();
//   }
//
//   //-----------------------------------------
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.yellow[100],
//           centerTitle: true,
//           title: Text(
//             'API ',
//             style: TextStyle(
//               fontSize: 30.0,
//               color: Colors.pink,
//             ),
//           ),
//         ),
//         body: (myList.length == 0)
//             ? Center(child: CircularProgressIndicator())
//             : ListView(padding: EdgeInsets.all(20.0), children: myList),
//       ),
//     );
//   }
// }
