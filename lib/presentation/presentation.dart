import 'package:flutter/material.dart';

class Cv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'السيرة الذاتية',
          style: TextStyle(fontSize: 35, color: Colors.yellow),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Container(
          child: Align(
            alignment: Alignment.topCenter,
        child: Text('hello flutter'),
      )),
    );
  }
}
