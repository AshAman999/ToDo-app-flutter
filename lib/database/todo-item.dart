import 'package:to_do/models/tasks.dart';

class Task extends Model {
  static String table = 'todo_items';

  int id;
  String name;
  bool isdone;

  Task({this.id, this.name, this.isdone});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {'name': name, 'isdone': isdone};

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(id: map['id'], name: map['name'], isdone: map['isdone'] == 1);
  }
}
