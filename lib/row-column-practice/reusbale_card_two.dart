import 'package:flutter/material.dart';

class ReusableCardTwo extends StatelessWidget {
  ReusableCardTwo({this.text1, this.text2, this.bgColor, this.icon});

  final String text1, text2;
  final IconData icon;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 15,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: bgColor,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text1,style: TextStyle(fontSize: 20),),
                  Text(
                    text2,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
