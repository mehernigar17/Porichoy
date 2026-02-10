import 'package:flutter/material.dart';
class Appstate  extends ChangeNotifier{
  bool _isDark=false;
  bool _isBangla=false;
  bool  get isDark=> _isDark;
  bool get isBangla=>_isBangla;
  void setDark(bool value){
    _isDark=value;
    notifyListeners();

  }
  void setLanguage(bool value){
    _isBangla=value;
    notifyListeners();
  }

}