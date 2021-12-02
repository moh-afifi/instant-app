import 'package:cv/bmi/reusable_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  ResultPage({this.bmiRatio,this.text1,this.text2});
  final double bmiRatio;
  final String text1,text2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff2E2E2E),
      appBar: AppBar(
        centerTitle: true,
        //backgroundColor: Color(0xff191919),
        title: Text(
          'Your Health Status',
          style: TextStyle(
            fontSize: 30,
            color: Color(0xffB3B3B3),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xff424242),
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              bmiRatio.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 70,
                color: Color(0xffB3B3B3),
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              text1,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff7312BD),
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: 15,
                color: Color(0xffB3B3B3),
              ),
            ),
            ReusableButton(
              text: 'Re-Calculate',
              onPressed: () {

                Navigator.pop(context);

              },
            ),
          ],
        ),
      ),
    );
  }
}
