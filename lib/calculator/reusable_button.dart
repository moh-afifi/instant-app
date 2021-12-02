import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  ReusableButton({this.label, this.onPressed, this.color, this.heightRatio});

  final String label;
  final Color color;
  final Function onPressed;
  final double heightRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (heightRatio == null)
          ? MediaQuery.of(context).size.height * 0.1
          : MediaQuery.of(context).size.height * heightRatio,
      margin: EdgeInsets.all(2.0),
      child: FlatButton(
        padding: EdgeInsets.all(15.0),
        color: color,
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
