import 'package:cv/navigation/second_page.dart';
import 'package:flutter/material.dart';


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('first Page'),),
      body: Center(child: Column(
        children: [
          Text('firstPage'),
          FlatButton(
            child: Text('go to second Page'),
            color: Colors.teal,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
          )
        ],
      ),),
    );
  }
}
