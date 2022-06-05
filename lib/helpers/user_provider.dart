import 'package:balda2/models/AuthModels/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  late User user = User(
    id: '',
    firstName: '',
    lastName: '',
    phoneNumber: '',
    apiToken: '',
    active: '',
    upgrade: '',
    photo: '',
    createdAt: '',
  );

  void setUser(User user) {
    user = user;
    notifyListeners();
  }

  void clearUser() {
    user = User(
      id: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      apiToken: '',
      active: '',
      upgrade: '',
      photo: '',
      createdAt: '',
    );
    notifyListeners();
  }
}
