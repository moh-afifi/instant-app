// import 'package:cv/reusbale_card_two.dart';
// import 'package:flutter/material.dart';
// import 'reusable_card_one.dart';
//
// main() {
//   runApp(Home());
// }
//
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: Scaffold(
//           drawer: Drawer(),
//           appBar: AppBar(
//             centerTitle: true,
//             title: Text(
//               'Dashboard',
//               style: TextStyle(
//                 fontSize: 40,
//                 color: Colors.yellow,
//               ),
//             ),
//           ),
//           body: Column(
//             children: [
//               SizedBox(
//                 height: 20,
//               ),
//               ReusableCardOne(
//                 text1: 'Total Revenue',
//                 text2: '240,000.00 GBP',
//                 bgColor: Colors.blue,
//                 icon: Icons.show_chart,
//               ),
//               Row(
//                 children: [
//                   ReusableCardTwo(
//                     text1: 'Invoices sent',
//                     text2: '74',
//                     icon: Icons.send,
//                     bgColor: Colors.amber,
//                   ),
//                   ReusableCardTwo(
//                     text1: 'Active Clients',
//                     text2: '10',
//                     icon: Icons.group,
//                     bgColor: Colors.grey,
//                   ),
//                 ],
//               ),
//               ReusableCardOne(
//                 text1: 'Average Invoice',
//                 text2: '373,3333.00 GBP',
//                 bgColor: Colors.green,
//                 icon: Icons.mail,
//               ),
//               ReusableCardOne(
//                 text1: 'Outstanding',
//                 text2: '0.00 GBP',
//                 bgColor: Colors.red,
//                 icon: Icons.access_time,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:cv/home.dart';
// import 'package:flutter/material.dart';
//
// main(){
//   runApp(Home());
// }
//
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: FirstPage(),
//     );
//   }
// }