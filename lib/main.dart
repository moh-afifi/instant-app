


//***************************************************************************************

import 'package:cv/search/search_practice.dart';
import 'package:cv/state_management/screens/multi_screens.dart';
import 'package:cv/task_local/task_home.dart';
import 'package:cv/task_local/task_logic.dart';
import 'file:///C:/flutterProjects/projects/itSharks/cv/lib/state_management/screens/counter.dart';
import 'file:///C:/flutterProjects/projects/itSharks/cv/lib/state_management/model/counter_logic.dart';
import 'file:///C:/flutterProjects/projects/itSharks/cv/lib/state_management/model/text_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskLogic>(create: (context)=>TaskLogic()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchPractice(),
      ),
    );
  }
}


// final http.Response response = await http.patch(
// 'https://young-reaches-10557.herokuapp.com/update/${widget.id}',
// headers: <String, String>{
// 'Content-Type': 'application/json; charset=UTF-8',
// },
// body: jsonEncode(<String, String>{
// 'doctor': doctor,
// 'subject': subject,
// 'hall': hall,
// 'from': from,
// 'to': to,
// }),
// );
// if (response.statusCode == 200) {
// // If the server did return a 200 OK response,
// // then parse the JSON.
// return Album.fromJson(json.decode(response.body));
// } else {
// // If the server did not return a 200 OK response,
// // then throw an exception.
// throw Exception('Failed to update album.');
// }


// final http.Response response = await http.delete(
// 'https://young-reaches-10557.herokuapp.com/delete/$id',
// headers: <String, String>{
// 'Content-Type': 'application/json; charset=UTF-8',
// },
// );
//
// if (response.statusCode == 200) {
// return Album.fromJson(jsonDecode(response.body));
// } else {
//
// throw Exception('Failed to delete album.');
// }