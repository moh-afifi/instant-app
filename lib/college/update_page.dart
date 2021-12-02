import 'package:cv/college/college_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdatePage extends StatefulWidget {
  UpdatePage({this.id});

  String id;

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String doctor, subject, hall, from, to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Update Data'),
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
            onPressed: () async {
              String url =
                  'https://young-reaches-10557.herokuapp.com/update/${widget.id}';
              http.Response response = await http.patch(
                Uri.parse(url),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode({
                  'doctor':doctor,
                  'subject':subject,
                  'hall':hall,
                  'from':from,
                  'to':to
                })
              );

              if(response.statusCode==200){
                print('updated successfully');
              Navigator.pop(context);
              }else{
                print('failed');
              }
            },
            style: TextButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.all(10),
                elevation: 10),
            child: Text(
              'Update',
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
