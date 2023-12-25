import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  bool isOnline;
  AppState({required this.isOnline});

  void changeOnline({required bool isOnlineValue}) {
    isOnline = isOnlineValue;
    notifyListeners();
  }
}
