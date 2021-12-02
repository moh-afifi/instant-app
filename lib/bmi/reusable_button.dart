import 'package:flutter/material.dart';


class ReusableButton extends StatelessWidget {
  ReusableButton({this.text,this.onPressed});

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(35.0),
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2),
      child: FlatButton(
        padding: EdgeInsets.all(15),
        color: Color(0xff7312BD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        onPressed: onPressed,
        child: Text(text,style: TextStyle(color: Colors.white,fontSize: 20,),),
      ),
    );
  }
}