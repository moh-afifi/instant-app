import 'package:cv/firebase/get_data.dart';
import 'package:cv/firebase/get_data_2.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Crud extends StatefulWidget {
  @override
  _CrudState createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  String name, age, status,newName;
  var _fireStore = FirebaseFirestore.instance;
  bool spinner =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text(
          'CRUD',
          style: TextStyle(
            fontSize: 35,
            color: Colors.pink,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
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
            TextField(
              onChanged: (val) {
                age = val;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter your age',
                  labelText: 'age'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (val) {
                status = val;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'enter your status',
                labelText: 'status',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              padding: EdgeInsets.all(15),
              color: Colors.teal,
              onPressed: () async{

                setState(() {
                  spinner=true;
                });

                await _fireStore.collection('students').add({
                  'name':name,
                  'age':age,
                  'status':status
                });

                setState(() {
                  spinner=false;
                });

                // await _fireStore.collection('students').doc('myCustomId').set({
                //   'name':name,
                //   'age':age,
                //   'status':status
                // });

              },
              child: Text(
                'ADD',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //---------------------------------------------
            TextField(
              onChanged: (val){
                newName=val;
              },
              decoration: InputDecoration(
                hintText: 'enter new name',
                labelText: 'new name',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              color: Colors.yellow,
              padding: EdgeInsets.all(20),
              onPressed: () async{
                await _fireStore.collection('students').doc('myCustomId').update({
                  'name':newName
                });
              },
              child: Text('update',style: TextStyle(fontSize: 25,),),
            ),
            SizedBox(
              height: 20,
            ),

            FlatButton(
              color: Colors.red,
              padding: EdgeInsets.all(20),
              onPressed: () async{
             await _fireStore.collection('students').doc('myCustomId').delete();
              },
              child: Text('delete',style: TextStyle(fontSize: 25,),),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              color: Colors.pink,
              padding: EdgeInsets.all(15),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>GetDataTwo()
                  ),
                );
              }, child: Text('get data',style: TextStyle(fontSize: 25,color: Colors.white,),),),
          ],
        ),
      ),
    );
  }
}
