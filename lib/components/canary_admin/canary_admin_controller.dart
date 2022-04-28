import 'package:flutter/cupertino.dart';

class CanaryAdminController extends ChangeNotifier {
  int _indexSelected = 0;

  void changeIndexSelected(int index) {
    _indexSelected = 0;
    notifyListeners();
  }

  int get index => _indexSelected;
}
