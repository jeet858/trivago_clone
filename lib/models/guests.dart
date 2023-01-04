import 'package:flutter/material.dart';

class Guests with ChangeNotifier {
  List<int> guests = [2, 0, 1];
  void updateAdults(int adults) {
    guests[0] = adults;
    notifyListeners();
  }

  void updateChild(int child) {
    guests[1] = child;
    notifyListeners();
  }

  void updateRoom(int room) {
    guests[2] = room;
    notifyListeners();
  }
}
