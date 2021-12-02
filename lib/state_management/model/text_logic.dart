
import 'package:flutter/material.dart';

class TextLogic extends ChangeNotifier{

  String text ='welcome';

  void changeText(String val){
    text=val;
    notifyListeners();
  }

}