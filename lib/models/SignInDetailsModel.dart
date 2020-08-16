import 'package:flutter/material.dart';

class SignInDetailsModel with ChangeNotifier {
  String _user = "";
  DateTime _signInOn;
  String get user => _user;
  DateTime get signInOn => _signInOn;

  void signIn(String userName) {
    _user = userName;
    _signInOn = DateTime.now();
    notifyListeners();
  }

  void signOut() {
    _user = "";
    _signInOn = null;
    notifyListeners();
  }
}
