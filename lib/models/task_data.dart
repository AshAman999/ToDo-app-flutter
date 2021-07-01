import 'package:flutter/cupertino.dart';
import 'tasks.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [Task(name: "hello", isdone: false)];

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle, isdone: false);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toogleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
