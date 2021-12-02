import 'package:flutter/material.dart';

class SecondAnimation extends StatefulWidget {
  @override
  _SecondAnimationState createState() => _SecondAnimationState();
}

class _SecondAnimationState extends State<SecondAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('second animation'),
        centerTitle: true,
      ),
      body: Center(
        child: Hero(
          tag: 'photo',
          child: Container(
            width: 350,
            height: 350,
            child: Image.asset('images/monkey.jpg'),
          ),
        ),
      ),
    );
  }
}
