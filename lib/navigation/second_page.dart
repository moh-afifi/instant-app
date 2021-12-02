import 'package:cv/navigation/third_page.dart';
import 'package:flutter/material.dart';


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('second Page'),),
      body: Center(child: Column(
        children: [
          Text('second Page'),
          FlatButton(
            child: Text('go to third Page'),
            color: Colors.teal,
            onPressed: (){

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ThirdPage()),
              );
            },
          )
        ],
      ),),
    );
  }
}
