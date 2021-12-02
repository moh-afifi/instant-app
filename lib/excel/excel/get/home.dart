import 'package:cv/excel/excel/get/feedback_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<FeedbackModel> feedbacks = List<FeedbackModel>();

  getFeedbackFromSheet() async {
    var raw = await http.get(
        "https://script.google.com/macros/s/AKfycbyzh7lGXLMd1g12M2ibHenm8zHmoNy5Yw_ah1RWqB7xzx6iZ3kp5CCUhLWqHUDVUtr5/exec");
print(raw.body);
    var jsonFeedback =  convert.jsonDecode(raw.body);
    print('this is json Feedback $jsonFeedback');

    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback.forEach((element) {
      print('$element THIS IS NEXT>>>>>>>');
      FeedbackModel feedbackModel = new FeedbackModel();
      feedbackModel.name = element['name'];
      feedbackModel.feedback = element['feedback'];
      feedbackModel.profilePic = element['profile_pic'];
      feedbackModel.source = element['source'];
      feedbackModel.sourceUrl = element["source_url"];

      feedbacks.add(feedbackModel);
    });

    //print('${feedbacks[0]}');
  }

  @override
  void initState() {
    getFeedbackFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
        elevation: 0,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: feedbacks.length,
            itemBuilder: (context, index) {
              return FeedbackTile(
                profilePic: feedbacks[index].profilePic,
                name: feedbacks[index].name,
                source: feedbacks[index].source,
                feedback: feedbacks[index].feedback,
                sourceUrl: feedbacks[index].sourceUrl,
              );
            }),
      ),
    );
  }
}

class FeedbackTile extends StatelessWidget {
  final String profilePic, name, source, feedback, sourceUrl;
  FeedbackTile(
      {this.profilePic, this.name, this.source, this.feedback, this.sourceUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text(
                'from $source',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          SizedBox(height: 16),
          Text(feedback)
        ],
      ),
    );
  }
}