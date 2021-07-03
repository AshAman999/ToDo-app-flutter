import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/models/db/db.dart';
import 'dart:collection';

import 'package:to_do/models/tasks.dart';

class TaskData extends ChangeNotifier {
  Task removedTask;

  TaskData() {
    init();
  }
  SharedPreferences sharedPreferences = Storage().sharedPreferences;
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  List<Task> _tasks = [];
  UnmodifiableListView<Task> get tasks {
    //we are creating getter as we set the main tasks to private. we did so , so that we remember that we can just add items to it using provider. we need to use the addTask method which we created.
    return UnmodifiableListView(_tasks); //also the above is unmodifieable
  }

  int get tasksCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle, isdone: false);
    _tasks.add(task);
    saveData();
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toogleDone();
    saveData();
    notifyListeners();
  }

  void deleteTask(Task task) {
    removedTask = task;

    _tasks.remove(task);
    notifyListeners();
    saveData();
  }

  void saveData() {
    List<String> spList =
        _tasks.map((item) => json.encode(item.toMap())).toList();
    print(spList);
    sharedPreferences.setStringList('list', spList);
  }

  void loadData() {
    List<String> spList = sharedPreferences.getStringList('list');
    _tasks = spList.map((item) => Task.fromMap(json.decode(item))).toList();
    notifyListeners();
  }

  void retrieveTask() {
    _tasks.add(removedTask);
    saveData();
    notifyListeners();
  }
}
