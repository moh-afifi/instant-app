import 'package:cv/firebase/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetData extends StatefulWidget {
  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  var _fireStore = FirebaseFirestore.instance;
  List<ReusableCard> cardList = [];

  void getData() async {
    await for (var snapshot in _fireStore.collection('students').snapshots()) {
      for (var items in snapshot.docs) {
        String name = items.data()['name'];
        String age = items.data()['age'];
        String status = items.data()['status'];

        var myCard = ReusableCard(
          name: name,
          age: age,
          status: status,
        );

        cardList.add(myCard);
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('get data'),
      ),
      body: ListView.builder(
          itemCount: cardList.length,
          itemBuilder: (context,index)=>cardList[index])
    );
  }
}
// ListView(
// children: (cardList.length == 0)
// ? [
// Center(
// child: CircularProgressIndicator(),
// )
// ]
// : cardList,
// ),
