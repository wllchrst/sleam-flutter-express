import 'package:flutter/material.dart';

class ColorNotifier extends ChangeNotifier {
  Color _background = Colors.white;
  Color _textColor = Colors.black;

  Color get background => _background;
  Color get textColor => _textColor;

  set background(Color color) {
    _background = color;
    notifyListeners();
  }

  set textColor(Color color) {
    _textColor = color;
    notifyListeners();
  }
}
