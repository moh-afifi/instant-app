import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int leftNumber = 1;
  int rightNumber = 1;

  String leftResult;
  String rightResult;

  List<Widget> leftList = [];
  List<Widget> rightList = [];

  int leftCounter = 0;
  int rightCounter = 0;

  changeCard() {
    setState(() {
      leftNumber = Random().nextInt(3) + 1;
      rightNumber = Random().nextInt(3) + 1;
      //-------------------------------------------
      if (leftNumber == 1 && rightNumber == 2) {
        leftResult = 'winner';
        rightResult = 'loser';

        leftCounter++;

        leftList.add(Icon(
          Icons.check,
          color: Colors.teal,
        ));
        rightList.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      } else if (leftNumber == 2 && rightNumber == 1) {
        leftResult = 'loser';
        rightResult = 'winner';

        rightCounter++;

        leftList.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
        rightList.add(Icon(
          Icons.check,
          color: Colors.teal,
        ));
      } else if (leftNumber == 1 && rightNumber == 3) {
        leftResult = 'loser';
        rightResult = 'winner';

        rightCounter++;

        leftList.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
        rightList.add(Icon(
          Icons.check,
          color: Colors.teal,
        ));
      } else if (leftNumber == 3 && rightNumber == 1) {
        leftResult = 'winner';
        rightResult = 'loser';
        leftCounter++;
        leftList.add(Icon(
          Icons.check,
          color: Colors.teal,
        ));
        rightList.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      } else if (leftNumber == 2 && rightNumber == 3) {
        leftResult = 'winner';
        rightResult = 'loser';

        leftCounter++;

        leftList.add(Icon(
          Icons.check,
          color: Colors.teal,
        ));
        rightList.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      } else if (leftNumber == 3 && rightNumber == 2) {
        leftResult = 'loser';
        rightResult = 'winner';
        rightCounter++;
        leftList.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
        rightList.add(Icon(
          Icons.check,
          color: Colors.teal,
        ));
      } else {
        leftResult = rightResult = 'Draw';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        (leftResult == null) ? '' : leftResult,
                        style: TextStyle(fontSize: 30, color: Colors.pink),
                      ),
                      Container(
                        height: 200,
                        margin: EdgeInsets.all(15.0),
                        child: Image.asset('images/$leftNumber.jpg'),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                        ),
                      ),
                      Wrap(
                        children: leftList,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.yellow,
                        child: Text(
                          leftCounter.toString(),
                          style: TextStyle(color: Colors.pink, fontSize: 30),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        (rightResult == null) ? '' : rightResult,
                        style: TextStyle(fontSize: 30, color: Colors.pink),
                      ),
                      Container(
                        height: 200,
                        margin: EdgeInsets.all(15.0),
                        child: Image.asset('images/$rightNumber.jpg'),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                        ),
                      ),
                      Wrap(
                        children: rightList,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.yellow,
                        child: Text(
                          rightCounter.toString(),
                          style: TextStyle(color: Colors.pink, fontSize: 30),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              color: Colors.teal,
              onPressed: () {
                changeCard();
              },
              child: Text(
                'play',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              color: Colors.red,
              onPressed: () {
                setState(() {
                  leftResult=rightResult=null;
                  leftList.clear();
                  rightList.clear();
                  leftCounter=rightCounter=0;
                });
              },
              child: Text('Finish',style: TextStyle(color: Colors.white,fontSize: 25),),
            )
          ],
        ),
      ),
    );
  }
}
