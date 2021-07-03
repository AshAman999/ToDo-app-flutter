import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'tasks.dart';

class TaskData extends ChangeNotifier {
  List<Box<Task>> tasks = [Hive.box<Task>('todos')];

  // List<Task> tasks = tasks;
  //  Box<Todo> tasks = Hive.box<Todo>('todos');

  void addTask(String newTaskTitle) {
    final tasks = Task(name: newTaskTitle, isdone: false);
    tasks.add(tasks);
    // taskss.add(tasks);
    notifyListeners();
  }

  void updateTask(Task tasks) {
    tasks.toogleDone();
    notifyListeners();
  }

  void deleteTask(Task tasks, int index) async {
    await tasks.deleteAt(index);
    // taskss.remove(tasks);
    notifyListeners();
  }

  void submitData(Task tasks) async {
    tasks.add(tasks);
  }
}
