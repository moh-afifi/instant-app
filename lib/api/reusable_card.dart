import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.body, this.title});

  final String title, body;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.yellow,
      elevation: 15,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              'title : $title',
              style: TextStyle(
                fontSize: 15,
                color: Colors.purple,
              ),
            ),
            Text(
              'body : $body',
              style: TextStyle(
                fontSize: 15,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
