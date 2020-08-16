import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  String _card;

  String get card => _card;

  void addCard(String cardNumber) {
    _card = cardNumber;
    notifyListeners();
  }

  void removeCard() {
    _card = "";
    notifyListeners();
  }
}
