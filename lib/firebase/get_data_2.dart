import 'package:cv/firebase/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetDataTwo extends StatefulWidget {
  @override
  _GetDataTwoState createState() => _GetDataTwoState();
}

class _GetDataTwoState extends State<GetDataTwo> {
  var _fireStore = FirebaseFirestore.instance;
  String newName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('get data 2'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _fireStore.collection('students').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var snap = snapshot.data.docs;
          List<ReusableCard> cardList = [];
          for (var item in snap) {
            String name = item.data()['name'];
            String age = item.data()['age'];
            String status = item.data()['status'];
            String id = item.id;

            var itemCard = ReusableCard(
              name: name,
              age: age,
              status: status,
              onChanged: (val) {
                newName=val;
              },
              onUpdate: () async{
                await _fireStore.collection('students').doc(id).update({
                  'name':newName
                });
              },
              onDelete: () async{
                await _fireStore.collection('students').doc(id).delete();
              },
            );
            cardList.add(itemCard);
          }
          return ListView(
            padding: EdgeInsets.all(15),
            children: cardList,
          );
        },
      ),
    );
  }
}
