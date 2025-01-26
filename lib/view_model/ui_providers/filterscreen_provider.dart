import 'package:flutter/material.dart';

class FilterscreenProvider with ChangeNotifier {
  String _selectedValue = '';
  String get selectedValue => _selectedValue;

  void setSelectedValue(String value) {
    _selectedValue = value;
    notifyListeners();
  }

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  bool _onpressed = false;
  bool get onpressed => _onpressed;
  void togglepress() {
    _onpressed = !_onpressed;
    notifyListeners();
  }

  String _salesselectedValue = '';
  String get saleselectedValue => _salesselectedValue;

  void salesSelectedValue(String value) {
    _salesselectedValue = value;
    notifyListeners();
  }
}
