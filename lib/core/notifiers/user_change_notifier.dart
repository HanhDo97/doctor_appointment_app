import 'package:doctor_appointment/config/http_config.dart';
import 'package:flutter/material.dart';

class UserChangeNotifier extends ChangeNotifier {
  User _user = User(name: '', email: '');

  User get user => _user;

  void setUser(Map<String, dynamic> user) {
    _user = User(
      name: user['name'],
      email: user['email'],
      image: user['image'],
    );
    notifyListeners();
  }

  void reset() {
    _user = User(
        name: '',
        email: '',
        image: HttpConfig.serverUrl + 'images/NoneImage.jfif');
    notifyListeners();
  }
}

class User {
  final String? name;
  final String? email;
  final String? image;

  User({this.name, this.email, this.image});
}
