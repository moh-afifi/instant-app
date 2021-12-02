import 'package:flutter/material.dart';

class ModelProvider extends ChangeNotifier{

  String appBarText ='hello appBar';
  String bodyText ='hello body';

void changeText(String val){
  bodyText=val;
  notifyListeners();
}


}