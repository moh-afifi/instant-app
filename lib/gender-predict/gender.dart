import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String name, gender, probability;
  // postData() async{
  //   var response = await http.post(
  //     'https://young-reaches-10557.herokuapp.com/add',
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'doctor': 'aaaaaaaaaaa',
  //       'subject':'aaaaaaaaaaa',
  //       'hall':'aaaaaaaaaaa',
  //       'from': 'aaaaaaaaaaa',
  //       'to':'aaaaaaaaaaa'
  //     }),
  //   );
  //   if (response.statusCode == 201) {
  //     print(response.body);
  //     // return Album.fromJson(json.decode(response.body));
  //   } else {
  //     print('failed');
  //   }
  // }
  void getData(String userName) async {
    String url = 'https://api.genderize.io/?name=$userName';
    var response = await http.get(Uri.parse(url));
    var body = jsonDecode(response.body);
    gender = body['gender'];
    probability = body['probability'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gender Predict'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Enter tour name:',
            style: TextStyle(fontSize: 20, color: Colors.teal),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (val) {
              name = val;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'enter your name',
                labelText: 'name'),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal,
              elevation: 10,
            ),
            onPressed: () {
              setState(() {
                getData(name);
              });
            },
            child: Text(
              'Ok',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          (gender == null || probability == null)
              ? SizedBox()
              : Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Card(
                        elevation: 12,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(gender),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Card(
                        elevation: 12,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(probability),
                        ),
                      ),
                    )
                  ],
                )
        ],
      ),
    );
  }
}
