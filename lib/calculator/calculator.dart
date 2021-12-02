import 'package:flutter/material.dart';
import 'reusable_button.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation='';
  String result = '0';


  void calculate(String text) {
    setState(() {
      if(text=='C'){
        equation=null;
        result='0';
      }else if(text=='⌫'){
        equation=equation.substring(0,equation.length-1);
        if(equation==''){
          equation='0';
        }
      }else if(text=='='){
        equation=equation.replaceAll('x', '*');
        equation=equation.replaceAll('÷', '/');

        // expression=equation;
        Parser p = Parser();
        Expression exp = p.parse(equation);
        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';

      }
      else{
        if(equation==null){
          equation='0';
          equation=equation+text;
        }else{
          equation=equation+text;
        }
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              equation??'0',
              style: TextStyle(fontSize: 50),
            ),
            alignment: Alignment.topRight,
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              result,
              style: TextStyle(fontSize: 50),
            ),
            alignment: Alignment.topRight,
          ),
          Expanded(
            child: SizedBox(),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(children: [
                      ReusableButton(
                        color: Colors.red,
                        label: 'C',
                        onPressed: () => calculate('C'),
                      ),
                      ReusableButton(
                        color: Colors.lightBlue,
                        label: '⌫',
                        onPressed: () => calculate('⌫'),
                      ),
                      ReusableButton(
                        color: Colors.lightBlue,
                        label: '÷',
                        onPressed: () => calculate('÷'),
                      ),
                    ]),
                    TableRow(children: [
                      ReusableButton(
                        color: Colors.black45,
                        label: '7',
                        onPressed: () => calculate('7'),
                      ),
                      ReusableButton(
                        color: Colors.black45,
                        label: '8',
                        onPressed: () => calculate('8'),
                      ),
                      ReusableButton(
                        color: Colors.black45,
                        label: '9',
                        onPressed: () => calculate('9'),
                      ),
                    ]),
                    TableRow(children: [
                      ReusableButton(
                        color: Colors.black45,
                        label: '4',
                        onPressed: () => calculate('4'),
                      ),
                      ReusableButton(
                        color: Colors.black45,
                        label: '5',
                        onPressed: () => calculate('5'),
                      ),
                      ReusableButton(
                        color: Colors.black45,
                        label: '6',
                        onPressed: () => calculate('6'),
                      ),
                    ]),
                    TableRow(children: [
                      ReusableButton(
                        color: Colors.black45,
                        label: '1',
                        onPressed: () => calculate('1'),
                      ),
                      ReusableButton(
                        color: Colors.black45,
                        label: '2',
                        onPressed: () => calculate('2'),
                      ),
                      ReusableButton(
                        color: Colors.black45,
                        label: '3',
                        onPressed: () => calculate('3'),
                      ),
                    ]),
                    TableRow(children: [
                      ReusableButton(
                        color: Colors.black45,
                        label: '.',
                        onPressed: () => calculate('.'),
                      ),
                      ReusableButton(
                        color: Colors.black45,
                        label: '0',
                        onPressed: () => calculate('0'),
                      ),
                      ReusableButton(
                        color: Colors.black45,
                        label: '00',
                        onPressed: () => calculate('00'),
                      ),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      ReusableButton(
                        color: Colors.lightBlue,
                        label: 'x',
                        onPressed: () => calculate('x'),
                      ),
                    ]),
                    TableRow(children: [
                      ReusableButton(
                        color: Colors.lightBlue,
                        label: '-',
                        onPressed: () => calculate('-'),
                      ),
                    ]),
                    TableRow(children: [
                      ReusableButton(
                        color: Colors.lightBlue,
                        label: '+',
                        onPressed: () => calculate('+'),
                      ),
                    ]),
                    TableRow(children: [
                      ReusableButton(
                        color: Colors.red,
                        label: '=',
                        onPressed: () => calculate('='),
                        heightRatio: 0.205,
                      ),
                    ]),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
