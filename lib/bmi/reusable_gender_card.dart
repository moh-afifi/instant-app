import 'package:flutter/material.dart';

class MaleFemaleCard extends StatelessWidget {
  MaleFemaleCard({this.text,this.icon,this.genderIcon,this.onPressed,this.toggle});
  final String text;
  final IconData icon;
  final IconData genderIcon;
  final Function onPressed;
  final bool toggle;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff424242),
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Icon(
              icon,
              size: 80,
              color: Color(0xffB3B3B3),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color(0xffB3B3B3),
              ),
            ),
            IconButton(
              icon: Icon(
                  (toggle) ? Icons.check_box : Icons.check_box_outline_blank,
                color: Colors.purple,
                size: 50,
              ),
              onPressed:onPressed,
            )
          ],
        ),
      ),
    );
  }
}