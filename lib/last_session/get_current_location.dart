// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:print/last_session/show_pdf.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class MyCurrentLocation extends StatefulWidget {
//   @override
//   _MyCurrentLocationState createState() => _MyCurrentLocationState();
// }
//
// class _MyCurrentLocationState extends State<MyCurrentLocation> {
//   double lat, long;
//   String phone, mail;
//
//   //----------------------------------------------------------
//   void displayLocation(double lat, long) {
//     String mapUrl =
//         'https://www.google.com/maps/search/?api=1&query=$lat,$long';
//     launch(mapUrl);
//     // launch('https://www.youtube.com/');
//   }
//
//   //----------------------------------------------------------
//   Future<void> getMyLocation() async {
//     var loc = await Location().getLocation();
//     lat = loc.latitude;
//     long = loc.longitude;
//     print('$lat ************ $long');
//   }
//
//   //---------------------------------------------------------
// // @override
// //   void initState() {
// //    getMyLocation();
// //     super.initState();
// //   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'location page',
//           style: TextStyle(
//             fontSize: 30,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               FlatButton(
//                 minWidth: double.infinity,
//                 padding: EdgeInsets.all(20),
//                 color: Colors.teal,
//                 onPressed: () async {
//                   await getMyLocation();
//                 },
//                 child: Text(
//                   'get location',
//                   style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               //-----------------------------------
//               FlatButton(
//                 minWidth: double.infinity,
//                 padding: EdgeInsets.all(20),
//                 color: Colors.blue,
//                 onPressed: () {
//                   displayLocation(lat, long);
//                 },
//                 child: Text(
//                   'display location',
//                   style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               //-----------------------------------------
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: 250,
//                     child: TextField(
//                       onChanged: (val) {
//                         phone = val;
//                       },
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                           labelText: 'phone',
//                           hintText: 'enter your phone',
//                           border: OutlineInputBorder()),
//                     ),
//                   ),
//                   //---------------------------------------
//                   FlatButton(
//                       padding: EdgeInsets.all(10),
//                       color: Colors.teal,
//                       onPressed: () async {
//                         await launch('tel://$phone');
//                       },
//                       child: Icon(
//                         Icons.phone,
//                         color: Colors.white,
//                       )),
//                 ],
//               ),
//               //-----------------------------------------
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: 250,
//                     child: TextField(
//                       onChanged: (val) {
//                         mail = val;
//                       },
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                           labelText: 'mail',
//                           hintText: 'enter your email',
//                           border: OutlineInputBorder()),
//                     ),
//                   ),
//                   //---------------------------------------
//                   FlatButton(
//                     padding: EdgeInsets.all(10),
//                     color: Colors.teal,
//                     onPressed: () {
//                       launch('mailto:$mail');
//                     },
//                     child: Icon(
//                       Icons.email,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               //-----------------------------------------
//               FlatButton(
//                 padding: EdgeInsets.all(10),
//                 color: Colors.purple,
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ShowPDF(),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   'show PDF',
//                   style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
