// import 'dart:convert' as convert;
// import 'file:///C:/flutterProjects/projects/itSharks/cv/lib/excel/insert/model.dart';
// import 'package:http/http.dart' as http;
//
//
// class FormController {
//   // Callback function to give response of status of current request.
//   final void Function(String) callback;
//
//   // Google App Script Web URL
//   static const String URL = "https://script.google.com/macros/s/AKfycbz5TM4CJX4k1xRHejytK27BcA1Yw_1QT1IYWXPL-vNGE6GC2Gmxx9RSqpaco8Kjupcx/exec";
//
//   static const STATUS_SUCCESS = "SUCCESS";
//
//   FormController(this.callback);
//
//   void submitForm(FeedbackForm feedbackForm) async{
//     try{
//       await http.get(URL + feedbackForm.toParams()).then(
//               (response){
//             callback(convert.jsonDecode(response.body)['status']);
//           });
//     } catch(e){
//       print(e);
//     }
//   }
// }