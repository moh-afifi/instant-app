import 'dart:convert';
import 'package:cv/college/delete_logic.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:cv/college/college_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CollegeApp extends StatefulWidget {
  @override
  _CollegeAppState createState() => _CollegeAppState();
}

class _CollegeAppState extends State<CollegeApp> {
  List<CollegeCard> cardList = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  getData() async {
    String doctor, subject, hall, from, to, id;
    String url = 'https://newsapi.org/v2/everything?q=bitcoin&from=2021-09-28&sortBy=publishedAt&apiKey=6c5f2a7e716c421b8d65735170dba649';
    var response = await http.get(Uri.parse(url));
    var body = jsonDecode(response.body);
    for(int i=0;i<body['articles'].length;i++){
      String title= body['articles'][0]['source']['name'];
      print('$title *********');
    }




    // for (int i = 0; i < body.length; i++) {
    //   doctor = body[i]['doctor'];
    //   subject = body[i]['subject'];
    //   hall = body[i]['hall'];
    //   from = body[i]['from'];
    //   to = body[i]['to'];
    //   id = body[i]['_id'];
    //   if (body[i]['doctor'] == null ||
    //       body[i]['subject'] == null ||
    //       body[i]['hall'] == null ||
    //       body[i]['from'] == null ||
    //       body[i]['to'] == null) {
    //   } else {
    //     cardList.add(
    //       CollegeCard(
    //         doctor: doctor,
    //         subject: subject,
    //         hall: hall,
    //         from: from,
    //         to: to,
    //         id: id,
    //       ),
    //     );
    //   }
    // }
    setState(() {});
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // postData();
    getData();
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: () {
          cardList.clear();
          getData();
        },
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Text(
              'College App',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child:  ListView.builder(
                        padding: EdgeInsets.all(15),
                        itemCount: cardList.length,
                        itemBuilder: (context, index) {
                          return cardList[index];
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ListView(
// padding: EdgeInsets.symmetric(horizontal: 15),
// children: cardList,
// ),
