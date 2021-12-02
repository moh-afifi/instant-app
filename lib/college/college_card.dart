import 'package:cv/college/delete_logic.dart';
import 'package:cv/college/update_page.dart';
import 'package:flutter/material.dart';

class CollegeCard extends StatelessWidget {
  CollegeCard({
    this.doctor,
    this.subject,
    this.hall,
    this.from,
    this.to,
    this.id,
  });
  final String doctor, subject, hall, from, to, id;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(color: Colors.red,),
      key: Key(UniqueKey().toString()),
      onDismissed: (dir){
        Delete _delete=Delete();
        print('$doctor *********************');
        _delete.delete(id);
      },
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Doctor Name: $doctor',
                style: myStyle,
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'SubjectName: $subject',
                style: myStyle,
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'Hall: $hall',
                style: myStyle,
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'From: $from',
                style: myStyle,
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'To: $to',
                style: myStyle,
              ),
              SizedBox(
                height: 7,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdatePage(id: id,),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.orange,
                      elevation: 5,
                      padding: EdgeInsets.all(10)),
                  child: Text(
                    'update',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle myStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.pink,
  );
}
