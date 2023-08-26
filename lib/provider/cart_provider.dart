import 'package:flutter/material.dart';

import '../models/models.dart';

class Cart extends ChangeNotifier {
  List<MenuModel> menuModels;
  List<MenuModel> get _menuModels => menuModels;

  final List<MenuModel> _cart = [];

  Cart({required this.menuModels}) {
    var values = _menuModels.where((e) => e.quantity > 0);
    _cart.addAll(values);
  }

  List<MenuModel> getAllMenuModels() => _menuModels;

  void addToCart(MenuModel model) {
    _cart.removeWhere((value) => value.id == model.id);
    _cart.add(model);
    notifyListeners();
  }

  void removeFromCart(MenuModel model) {
    _cart.removeWhere((value) => value.id == model.id);
    notifyListeners();
  }

  bool isCartEmpty() => _cart.isEmpty;

  List<MenuModel> getCart() => _cart;

  int get cartCount => _cart.length;

  double get totalCartValue {
    double totalValue = 0;
    for (var element in _cart) {
      var value = element.rate * element.quantity;
      totalValue += value;
    }
    return totalValue;
  }
}
