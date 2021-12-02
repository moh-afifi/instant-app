import 'dart:math';

class BmiCalc {

  String text1;
  String text2;
  double bmi;

void getBmi (int weight, double height){
  bmi = weight/pow(height/100, 2);
if(bmi>=25){
  text1 ='OverWeight';
  text2='You need to loose some weight';
}else if(bmi<18){
  text1='underweight';
  text2='you need to eat much more';
}else{
  text1='normal';
  text2='You have perfect shape';
}

}

}