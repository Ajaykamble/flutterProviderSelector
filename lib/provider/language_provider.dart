import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  bool isHindi=false;
  changeLanguage(){
    isHindi=!isHindi;
    notifyListeners();
  }
}