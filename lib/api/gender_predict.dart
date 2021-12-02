// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
//
// class Predict extends StatefulWidget {
//   @override
//   _PredictState createState() => _PredictState();
// }
//
// class _PredictState extends State<Predict> with SingleTickerProviderStateMixin {
//   String name;
//   AnimationController controller;
//   Animation animation;
//   //-----------------------------------
//   String gender;
//   String probability;
//   bool showSpinner = false;
//
//   Future predict(String name) async {
//     String url = 'https://api.genderize.io/?name=$name';
//     var res = await http.get(url);
//     var body = jsonDecode(res.body);
//     gender = body['gender'];
//     probability = (body['probability']).toString();
//   }
//
// //-------------------------------------------
// //  @override
// //  void initState() {
// //    super.initState();
// //
// //    controller =
// //        AnimationController(duration: Duration(seconds:3), vsync: this);
// //    animation = ColorTween(begin: Colors.white, end: Colors.red)
// //        .animate(controller);
// //    //-------------------------------------------------------
// //    controller.forward();
// //    //-------------------------------------------------------
// //    animation.addStatusListener((status) {
// //      if (status == AnimationStatus.completed) {
// //        controller.reverse(from: 1.0);
// //      } else if (status == AnimationStatus.dismissed) {
// //        controller.forward();
// //      } });
// //    //-------------------------------------------------------
// //    controller.addListener(() {
// //      setState(() {});
// //    });
// //  }
// //
// //  @override
// //  void dispose() {
// //    controller.dispose();
// //    super.dispose();
// //  }
//   //------------------------------------------
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
// //          backgroundColor: animation.value,
//           appBar: AppBar(
//             centerTitle: true,
//             title: Text(
//               'Gender',
//               style: TextStyle(fontSize: 40),
//             ),
//           ),
//           body: ModalProgressHUD(
//             inAsyncCall: showSpinner,
//             child: Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('images/profile.jpg'),
//                   fit: BoxFit.cover,
//                   colorFilter: ColorFilter.mode(
//                       Colors.white.withOpacity(0.9), BlendMode.dstATop),
//                 ),
//               ),
//               child: ListView(
//                 padding: EdgeInsets.all(20.0),
//                 children: <Widget>[
//                   SizedBox(
//                     height: 50,
//                   ),
//                   Text(
//                     'Enter your name to predict',
//                     style: TextStyle(
//                         fontSize: 25,
//                         color: Colors.purple,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   TextField(
//                     onChanged: (val) {
//                       name = val;
//                     },
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'enter your name',
//                       labelText: 'name',
//                     ),
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   FlatButton(
//                     padding: EdgeInsets.all(20.0),
//                     onPressed: () async {
//                       setState(() {
//                         showSpinner = true;
//                       });
//                       //-------------------------
//                       await predict(name);
//                       //-------------------------
//                       setState(() {
//                         showSpinner = false;
//                       });
//                     },
//                     color: Colors.teal,
//                     child: Text(
//                       'predict',
//                       style: TextStyle(
//                         fontSize: 30,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   (gender == null || probability == null)
//                       ? SizedBox()
//                       : TyperAnimatedTextKit(
//                     text: ['gender:', gender, 'probability:', probability],
//                     textStyle: TextStyle(
//                       fontSize: 35,
//                       color: Colors.pink,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
