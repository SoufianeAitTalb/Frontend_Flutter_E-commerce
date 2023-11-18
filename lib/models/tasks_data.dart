import 'package:flutter/cupertino.dart';
import 'package:e_commerce/Services/database_services.dart';
import 'package:e_commerce/models/task.dart';

class TasksData extends ChangeNotifier {
  List<Task> tasks = [];
  void addTask(String taskTitle, String descreption, String image, int price, double size, String type, int TB) async {
    Task task = await DatabaseServices.addTask(taskTitle, descreption, image, price, size, type, TB);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task, int TB) {
    // task.toggle();
    DatabaseServices.updateTask(task.id, TB);
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    DatabaseServices.deleteTask(task.id);
    notifyListeners();
  }

  int data = 1;

  void incrementData() {
    data++;
    notifyListeners();
  }

  void Ddata() {
    data--;
    notifyListeners();
  }

  void d() {
    data == 1;
    notifyListeners();
  }
}
