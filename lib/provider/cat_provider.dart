import 'package:flutter/material.dart';

class CatProvider extends ChangeNotifier {
  String _name = 'undefined michi 😼';
  String _gender = '';

  String get name => _name;
  String get gender => _gender;

  set name(String newName) {
    _name = newName;
    notifyListeners();
  }

  set gender(String newGender) {
    _gender = newGender;
    notifyListeners();
  }
}
