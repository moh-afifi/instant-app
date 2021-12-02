import 'package:flutter/material.dart';


class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('third Page'),),
      body: Center(child: Column(
        children: [
          Text('third Page'),
          FlatButton(
            child: Text('go to first Page'),
            color: Colors.teal,
            onPressed: (){

            },
          )
        ],
      ),),
    );
  }
}
