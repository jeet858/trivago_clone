import 'package:flutter/material.dart';

class DateData with ChangeNotifier {
  List<int> list = [
    DateTime.now().add(const Duration(days: 9)).day,
    DateTime.now().add(const Duration(days: 10)).day
  ];
  void updateStartDate(int date) {
    list[0] = date;
    notifyListeners();
  }

  void updateEndDate(int date) {
    list[1] = date;
    notifyListeners();
  }
}
