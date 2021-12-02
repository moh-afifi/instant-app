import 'package:cv/animation_practice/second_animation.dart';
import 'package:flutter/material.dart';

class FirstAnimation extends StatefulWidget {
  @override
  _FirstAnimationState createState() => _FirstAnimationState();
}

class _FirstAnimationState extends State<FirstAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('first animation'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: 'photo',
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset(
                  'images/monkey.jpg',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondAnimation(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Go To Next Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                  elevation: 10, backgroundColor: Colors.teal),
            )
          ],
        ),
      ),
    );
  }
}
