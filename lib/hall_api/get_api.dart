import 'dart:convert';
import 'package:cv/hall_api/hall_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HallGetApi extends StatefulWidget {
  @override
  _HallGetApiState createState() => _HallGetApiState();
}

class _HallGetApiState extends State<HallGetApi> {
  List<HallCard> myCardList = [];

  getHallData() async {
    String url = 'https://young-reaches-10557.herokuapp.com/search';
    var res = await http.get(url);
    var body = jsonDecode(res.body);
    String newName;
    for (int i = 0; i < 5; i++) {
      //--------------------------------------
      String doctor = body[i]['doctor'];
      String subject = body[i]['subject'];
      String hall = body[i]['hall'];
      String from = body[i]['from'];
      String to = body[i]['to'];
      String id = body[i]['_id'];
      //--------------------------------------
      var itemCard = HallCard(
        doctor: doctor,
        hallNum: hall,
        subject: subject,
        from: from,
        to: to,
        onChanged: (val){
          newName=val;
        },
        onPressed: () async{
          await http.patch(
            'https://young-reaches-10557.herokuapp.com/update/$id',
            headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
            body: jsonEncode(<String, String>{
              'doctor': newName,
            }),
          );
        },
        deleteFunction: () async{
          await http.delete(
            'https://young-reaches-10557.herokuapp.com/delete/$id',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
          );
        },
      );
      myCardList.add(itemCard);
    }
    setState(() {});
    //--------------------------------------
  }

  @override
  void initState() {
    getHallData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hall Get Data'),
      ),
      body: ListView(
        children: (myCardList.length == 0)
            ? [
                Center(
                  child: CircularProgressIndicator(),
                ),
              ]
            : myCardList,
      ),
    );
  }
}
