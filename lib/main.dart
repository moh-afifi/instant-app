// import 'package:cv/api/free_api.dart';
// import 'package:cv/api/login.dart';
// import 'package:cv/api/predict_gender.dart';
// import 'package:cv/api/register.dart';
// import 'package:cv/firebase/crud.dart';
// import 'package:flutter/material.dart';
// import 'package:cv/bmi/input_page.dart';
// import 'package:flutter/services.dart';
// import 'package:cv/bmi/result_page.dart';
// import 'navigation/first_page.dart';
// import 'hall_api/get_api.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'chat/register.dart';
// import 'chat/login.dart';
// import 'presentation/presentation.dart';
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(Home());
// }
//
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // SystemChrome.setPreferredOrientations([
//     //   DeviceOrientation.portraitUp,
//     //   DeviceOrientation.portraitDown,
//     // ]);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // theme: ThemeData(
//       //   scaffoldBackgroundColor:Color(0xff3C3C3C),
//       //   primaryColor:Color(0xff191919),
//       // ),
//       home: Cv(),
//     );
//   }
// }
//

import 'package:cv/animation_practice/animation_practice.dart';
import 'package:cv/animation_practice/first_animation.dart';
import 'package:cv/college/college_app.dart';
import 'package:cv/sales_db/emp_form.dart';
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