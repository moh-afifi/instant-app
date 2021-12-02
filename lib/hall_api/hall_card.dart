import 'package:flutter/material.dart';

class HallCard extends StatelessWidget {
  HallCard(
      {this.doctor,
      this.subject,
      this.hallNum,
      this.from,
      this.to,
      this.onChanged,
      this.onPressed,this.deleteFunction});

  final String doctor, subject, hallNum, from, to;
  final Function onChanged, onPressed,deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Column(
        children: [
          Text('doctor:$doctor'),
          Text('subject:$subject'),
          Text('hall number:$hallNum'),
          Text('from:$from'),
          Text('to:$to'),
          TextField(
            onChanged: onChanged,
          ),
          FlatButton(
            color: Colors.teal,
            onPressed: onPressed,
            child: Text('update'),
          ),
          FlatButton(
            color: Colors.red,
            onPressed: deleteFunction,
            child: Text('delete'),
          ),
        ],
      ),
    );
  }
}
