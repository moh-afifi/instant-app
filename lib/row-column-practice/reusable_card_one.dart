import 'package:flutter/material.dart';

class ReusableCardOne extends StatelessWidget {
  ReusableCardOne({@required this.text1, this.text2, this.bgColor, this.icon});

  final String text1, text2;
  final Color bgColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  text2,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: bgColor,
              radius: 30,
              child: Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
