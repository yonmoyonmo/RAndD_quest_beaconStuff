import 'package:flutter/material.dart';

class BeaconFootPrint with ChangeNotifier {
  List<int> footPrint = [
    0,
  ];
  BeaconFootPrint();
  getBeaconFootPrint() => footPrint;
  addFootPrint(int newStep) {
    footPrint.add(newStep);
    notifyListeners();
  }
}
