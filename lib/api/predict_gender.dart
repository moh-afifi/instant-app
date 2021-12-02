import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class PredictGender extends StatefulWidget {
  @override
  _PredictGenderState createState() => _PredictGenderState();
}

class _PredictGenderState extends State<PredictGender> {
  String name;
  String gender;
  double probability;
  bool spinner = false;
  final _formKey = GlobalKey<FormState>();

  Future predictGender() async {
    String url = 'https://api.genderize.io/?name=$name';
    var res = await http.get(url);
    var body = jsonDecode(res.body);
    gender = body['gender'];
    probability = body['probability'];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'Predict Gender',
          style: TextStyle(
            color: Colors.purple,
            fontSize: 35,
          ),
        ),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'enter your name:',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if(value.length == 0){
                      return 'mobile number is required';
                    }
                    else if (value.length != 11) {
                      return 'Please enter valid mobile number';
                    }
                    else if(value[0] != '0' || value[1] != '1'){
                      return 'Please enter valid mobile number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    print(value[2]);
                    name = value;
                  },
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      hintText: 'enter name',
                      border: OutlineInputBorder(),
                      labelText: 'name'),
                ),
                FlatButton(
                  color: Colors.teal,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        spinner = true;
                      });
                      await predictGender();
                      setState(() {
                        spinner = false;
                      });
                    }
                  },
                  child: Text(
                    'predict',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                (gender == null || probability == null)
                    ? SizedBox()
                    : ScaleAnimatedTextKit(
                        onFinished: () {
                          setState(() {});
                        },
                        repeatForever: false,
                        onTap: () {
                          print("Tap Event");
                        },
                        text: [
                          'Gender',
                          '$gender',
                          "probability",
                          '$probability'
                        ],
                        textStyle: TextStyle(fontSize: 40.0),
                        textAlign: TextAlign.start),
                // Text(
                //         'Gender :  , probability: $probability',
                //         style: TextStyle(
                //           fontSize: 30,
                //           color: Colors.pink,
                //         ),
                //       ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
