import 'dart:collection';
import 'package:flutter/foundation.dart';
import '../model/item.dart';

class ItemData with ChangeNotifier {
  final List<Item> _items = [];
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  get size => _items.length;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void toggleItem(Item item) {
    item.toggle();
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}
