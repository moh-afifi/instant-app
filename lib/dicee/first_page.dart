import 'package:flutter/material.dart';
import 'dart:math';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  int leftNumber=1;
  int rightNumber =1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Dicee',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset('images/dice$leftNumber.png'),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset('images/dice$rightNumber.png'),
                  ),
                ),
              ],
            ),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  leftNumber=Random().nextInt(6)+1;
                  rightNumber=Random().nextInt(6)+1;
                });

              },
              child: Text(
                'Play',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.teal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
