import 'dart:convert';

import 'package:http/http.dart' as http;

class Delete {

  void delete(String id) async {
    String url = 'https://young-reaches-10557.herokuapp.com/delete/$id';

    http.Response response = await http.delete(Uri.parse(url),
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if(response.statusCode==200){
      print('${jsonDecode(response.body)} *******************');
    }else{
      print('failed');
    }
  }

}