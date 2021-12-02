import 'package:flutter/material.dart';

class CounterLogic extends ChangeNotifier{
  int counter = 1;
  void increment(){
    counter++;
    notifyListeners();
  }
  void decrement(){
    counter--;
    notifyListeners();
  }



}