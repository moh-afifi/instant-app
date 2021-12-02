import 'package:cv/sales_db/sales_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmpForm extends StatefulWidget {
  @override
  _EmpFormState createState() => _EmpFormState();
}

class _EmpFormState extends State<EmpForm> {
  String name, address, age, phone;
  LocalDB _localDB = LocalDB();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Insert Data',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(
            height: 15,
          ),
          TextField(
            onChanged: (val) {
              name = val;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'enter name',
                labelText: 'name'),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            onChanged: (val) {
              address = val;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'enter address',
                labelText: 'address'),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            onChanged: (val) {
              phone = val;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'enter phone',
                labelText: 'phone'),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            onChanged: (val) {
              age = val;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'enter age',
              labelText: 'age',
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.all(15),
              elevation: 10,
            ),
            onPressed: () {
              _localDB.insertData(name, phone, address, int.parse(age));
            },
            child: Text(
              'Insert',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.all(15),
              elevation: 10,
            ),
            onPressed: () {
              // _localDB.getData();
              _localDB.getSingleData();
            },
            child: Text(
              'Get Data',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: EdgeInsets.all(15),
              elevation: 10,
            ),
            onPressed: () async {
              // _localDB.getData();
              int res = await _localDB.updateData(
                  name, phone, address, int.parse(age), 100);
              if (res == 0) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Update Failed'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Ok',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.teal,
                          elevation: 10,
                          padding: EdgeInsets.all(10),
                        ),
                      )
                    ],
                  ),
                );
              }else{}
            },
            child: Text(
              'Update Data',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.all(15),
              elevation: 10,
            ),
            onPressed: () async {
              // _localDB.getData();
              await _localDB.deleteData();

            },
            child: Text(
              'Delete Data',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
