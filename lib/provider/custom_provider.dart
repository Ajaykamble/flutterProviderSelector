import 'package:flutter/material.dart';
class CustomProvider with ChangeNotifier {
  
  CustomProvider();

  int widgetOneValue = 0;
  int widgetTwoValue = 0;
  int widgetThreeValue = 0;

  updatwWidgetOne() {
    widgetOneValue++;
    notifyListeners();
  }

  updatwWidgetTwo() {
    widgetTwoValue++;
    notifyListeners();
  }

  updatwWidgetThree() {
   widgetThreeValue++;
    notifyListeners();
  }
}
