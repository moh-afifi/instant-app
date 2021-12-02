import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.name, this.age, this.status,this.onUpdate,this.onDelete,this.onChanged});

  final String name, age, status;
  final Function onUpdate,onDelete,onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15),
      elevation: 15,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                color: Colors.purple,
              ),
            ),
            Text(
              age,
              style: TextStyle(
                fontSize: 20,
                color: Colors.purple,
              ),
            ),
            Text(
              status,
              style: TextStyle(
                fontSize: 20,
                color: Colors.purple,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'enter new name',
                labelText: 'new name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  padding: EdgeInsets.all(10),
                  color: Colors.teal,
                  onPressed: onUpdate,
                  child: Text(
                    'update',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                FlatButton(
                  padding: EdgeInsets.all(10),
                  color: Colors.red,
                  onPressed: onDelete,
                  child: Text(
                    'delete',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
