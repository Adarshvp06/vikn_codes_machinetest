import 'package:flutter/material.dart';

class ObscureProvider extends ChangeNotifier {
  bool _isObscure = true;
  bool get isObscure => _isObscure;

  void toggleobscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
}
