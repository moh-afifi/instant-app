import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.text1,this.text2,this.increase,this.decrease});
  final String text1;
  final String text2;
  final Function increase,decrease;
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
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              text1,
              style: TextStyle(
                color: Color(0xffB3B3B3),
                fontSize: 20,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                  fontSize: 40,
                  color: Color(0xffB3B3B3),
                  fontWeight: FontWeight.w900),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff606060),
                  child: IconButton(
                    icon: Icon(Icons.remove,color: Color(0xffB3B3B3),),
                    onPressed: decrease,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Color(0xff606060),
                  child: IconButton(
                    icon: Icon(Icons.add,color: Color(0xffB3B3B3),),
                    onPressed: increase,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}