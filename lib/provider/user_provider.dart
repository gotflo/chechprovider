import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _name = 'user has not been registered';
  String _lastName = '';
  late int _age = 0;

  String get name => _name;
  String get lastName => _lastName;
  int get age => _age;

  set name(String newName) {
    _name = newName;
    notifyListeners();
  }

  set lastName(String newLastName) {
    _lastName = newLastName;
    notifyListeners();
  }

  set age(int newAge) {
    _age = newAge;
    notifyListeners();
  }
}
