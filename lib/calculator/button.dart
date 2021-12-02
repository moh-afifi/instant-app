import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  ReusableButton({this.text, this.color, this.onPressed});
  final String text;
  final Color color;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      margin: EdgeInsets.all(1.0),
      height: MediaQuery.of(context).size.height * 0.1,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        color: color,
      ),
    );
  }
}
