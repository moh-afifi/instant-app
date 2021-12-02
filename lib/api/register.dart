import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name;
  String email;
  String password;
  bool spinner =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Builder(
        builder: (context)=>ModalProgressHUD(
          inAsyncCall:spinner ,
          child: ListView(
            padding: EdgeInsets.all(25),
            children: [
              TextField(
                onChanged: (val) {
                  name = val;
                },
                decoration:
                InputDecoration(hintText: 'enter your name', labelText: 'name'),
              ),
              //------------------------------------
              TextField(
                onChanged: (val) {
                  email = val;
                },
                decoration: InputDecoration(
                    hintText: 'enter your email', labelText: 'email'),
              ),
              //-----------------------------------
              TextField(
                onChanged: (val) {
                  password = val;
                },
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'enter your password', labelText: 'password'),
              ),
              //-----------------------------------
              SizedBox(
                height: 50,
              ),
              FlatButton(
                  color: Colors.teal,
                  onPressed: () async {
                    setState(() {
                      spinner=true;
                    });
                    http.Response response = await http.post(
                      'https://radiant-tundra-31777.herokuapp.com/register',
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        'name': name,
                        'email': email,
                        'password': password,
                      }),
                    );
                    setState(() {
                      spinner=false;
                    });
                    //-------------------------------
                    if (response.body == 'email already exists') {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('email exists'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }else{
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('email registered successfully'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                    //-----------------------------------------
                  },
                  child: Text(
                    'register',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      )
    );
  }
}
