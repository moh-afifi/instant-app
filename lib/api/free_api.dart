import 'dart:convert';

import 'package:cv/api/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiFree extends StatefulWidget {
  @override
  _ApiFreeState createState() => _ApiFreeState();
}

class _ApiFreeState extends State<ApiFree> {
  List<ReusableCard> myList = [];

  getData() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    var res = await http.get(url);
    var body = jsonDecode(res.body);

    for (int i = 0; i < body.length; i++) {
      String titleApi = body[i]['title'];
      String bodyApi = body[i]['body'];
      var itemList = ReusableCard(
        body: bodyApi,
        title: titleApi,
      );
      myList.add(itemList);
    }
    setState(() {});
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
        centerTitle: true,
        title: Text('API GET FOR FREE'),
      ),
      body: ListView(
        children: (myList.length == 0)
            ? [
                Center(
                  child: CircularProgressIndicator(),
                )
              ]
            : myList,
      ),
    );
  }
}
