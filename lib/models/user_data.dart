import 'package:flutter/cupertino.dart';
import 'package:e_commerce/Services/database_services.dart';
import 'package:e_commerce/models/user.dart';

class UserData extends ChangeNotifier {
  List<User> users = [];
  void addTask(String email, String name, String password) async {
    User task = await DatabaseServices.addUser(email, name, password);
    users.add(task);
    notifyListeners();
  }

  // void updateTask(Task task) {
  //   // task.toggle();
  //   DatabaseServices.updateTask(task.id);
  //   notifyListeners();
  // }

  // void deleteTask(Task task) {
  //   tasks.remove(task);
  //   DatabaseServices.deleteTask(task.id);
  //   notifyListeners();
  // }
}
