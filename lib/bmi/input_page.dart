import 'package:cv/bmi/result_page.dart';
import 'package:cv/bmi/reusable_button.dart';
import 'package:cv/bmi/reusable_card.dart';
import 'package:cv/bmi/reusable_gender_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cv/bmi/bmi_calculator.dart';



class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double height = 170;
  int age = 25;
  int weight = 75;
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff3C3C3C),
      appBar: AppBar(
        centerTitle: true,
       // backgroundColor: Color(0xff191919),
        title: Text(
          'BMI calculator',
          style: TextStyle(
            fontSize: 30,
            color: Color(0xffB3B3B3),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  text1: 'Age (In Year)',
                  text2: age.toString(),
                  decrease: () {
                    setState(() {
                      if (age > 1) age--;
                    });
                  },
                  increase: () {
                    setState(() {
                      age++;
                    });
                  },
                ),
                ReusableCard(
                  text1: 'Weight (Kg)',
                  text2: weight.toString(),
                  decrease: () {
                    setState(() {
                      if (weight > 10) weight--;
                    });
                  },
                  increase: () {
                    setState(() {
                      weight++;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
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
                Text(
                  'Height',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xffB3B3B3),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      height.toStringAsFixed(0),
                      style: TextStyle(
                          fontSize: 35,
                          color: Color(0xffB3B3B3),
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'cm',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffB3B3B3),
                      ),
                    )
                  ],
                ),
                Slider(
                  activeColor: Colors.purple,
                  inactiveColor: Colors.white,
                  min: 140,
                  max: 200,
                  value: height,
                  onChanged: (val) {
                    setState(() {
                      height = val;
                    });
                  },
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                MaleFemaleCard(
                  icon: FontAwesomeIcons.mars,
                  text: 'Male',
                  // genderIcon: (toggle) ? Icons.check_box : Icons.check_box_outline_blank,
                  toggle: toggle,
                  onPressed: () {
                    setState(() {
                      toggle = !toggle;
                    });
                  },
                ),
                MaleFemaleCard(
                  icon: FontAwesomeIcons.venus,
                  text: 'Female',
                  //  genderIcon: (toggle) ? Icons.check_box_outline_blank : Icons.check_box,
                  toggle: !toggle,
                  onPressed: () {
                    setState(() {
                      toggle = !toggle;
                    });
                  },
                ),
              ],
            ),
          ),
          ReusableButton(
            text: 'Calculate',
            onPressed: () {

              BmiCalc _bmiCalc = BmiCalc();
              _bmiCalc.getBmi(weight, height);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiRatio: _bmiCalc.bmi,
                    text1: _bmiCalc.text1,
                    text2: _bmiCalc.text2,
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
