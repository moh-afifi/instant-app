import 'dart:convert';

import 'package:cv/college/college_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  String doctor, subject, hall, from, to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Data'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            onChanged: (val) {
              doctor = val;
            },
            decoration: InputDecoration(
                labelText: 'doctor',
                hintText: 'enter doctor name',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (val) {
              subject = val;
            },
            decoration: InputDecoration(
                labelText: 'subject',
                hintText: 'enter subject',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (val) {
              hall = val;
            },
            decoration: InputDecoration(
                labelText: 'hall',
                hintText: 'enter hall number',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (val) {
              from = val;
            },
            decoration: InputDecoration(
                labelText: 'from',
                hintText: 'enter time',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (val) {
              to = val;
            },
            decoration: InputDecoration(
                labelText: 'to',
                hintText: 'enter time',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () async{
              String url = 'https://young-reaches-10557.herokuapp.com/add';
              http.Response response = await http.post(
                Uri.parse(url),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode({
                  'doctor':doctor,
                  'subject':subject,
                  'hall':hall,
                  'from':from,
                  'to':to,
                })
              );
              if(response.statusCode == 201){
                print('success');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CollegeApp(),
                  ),
                );
              }else{
                print('failed');
              }
            },
            style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.all(10),
                elevation: 10),
            child: Text(
              'ADD',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
