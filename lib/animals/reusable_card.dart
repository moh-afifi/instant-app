// import 'package:flutter/material.dart';
// import 'package:audioplayers/audio_cache.dart';
//
//
// class ReusableCard extends StatelessWidget {
//   ReusableCard({this.imagePath,this.audioPath});
//   final String imagePath,audioPath;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         var player = AudioCache();
//         player.play('$audioPath.mp3');
//       },
//       child: Card(
//         elevation: 20.0,
//         margin: EdgeInsets.all(25.0),
//         child: Image.asset(
//           'images/$imagePath',
//           height: 300,
//           width: 200,
//         ),
//       ),
//     );
//   }
// }
