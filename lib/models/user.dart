import 'package:flutter/cupertino.dart';

class User {
  final int id;
  final String email;
  final String name;
  final String password;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.password,
    // this.done = false,
  });
  factory User.fromMap(Map taskMap) {
    return User(
      id: taskMap['id'],
      email: taskMap['email'],
      name: taskMap['name'],
      password: taskMap['password'],
    );
    // void toggle() {
    //   done = !done;
    // }
  }
}
