// import 'package:flutter/material.dart';
// import 'dart:math';
//
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   int leftNumber = 1;
//   int rightNumber = 1;
//
//   void changeDiceFace() {
//     setState(() {
//       leftNumber = Random().nextInt(3) + 1;
//       rightNumber = Random().nextInt(3) + 1;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Random'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: Container(
//                     height: 300,
//                     margin: EdgeInsets.symmetric(horizontal: 15.0),
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.black)),
//                     child: Image.asset('images/$leftNumber.jpg'),
//                   ),
//                 ),
//                 //Get students to create the second die as a challenge
//                 Expanded(
//                   child: Container(
//                     height: 300,
//                     margin: EdgeInsets.symmetric(horizontal: 15.0),
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.black)),
//                     child: Image.asset('images/$rightNumber.jpg'),
//                   ),
//                 ),
//               ],
//             ),
//             FlatButton(
//               color: Colors.teal,
//               child: Text('play'),
//               onPressed: () {
//                 //-----------------------------------------------------
//                 changeDiceFace();
//                 //-----------------------------------------------------
//                 if (leftNumber == 1 && rightNumber == 2) {
//                   print('left wins');
//                 } else if (leftNumber == 2 && rightNumber == 1) {
//                   print('right wins');
//                 } else if (leftNumber == 2 && rightNumber == 3) {
//                   print('left wins');
//                 } else if (leftNumber == 3 && rightNumber == 2) {
//                   print('right wins');
//                 } else if (leftNumber == 3 && rightNumber == 1) {
//                   print('left wins');
//                 } else if (leftNumber == 1 && rightNumber == 3) {
//                   print('right wins');
//                 }
//                 //-----------------------------------------------------
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
