import 'package:flutter/material.dart';

class UserChangeNotifier extends ChangeNotifier {
  User _user = User(name: '', email: '');

  User get user => _user;

  void setUser(Map<String, dynamic> user) {
    print('line 9:');
    print(user['name']);
    _user = User(
      name: user['name'],
      email: user['email'],
    );
    notifyListeners();
  }
}

class User {
  final String? name;
  final String? email;

  User({this.name, this.email});
}
