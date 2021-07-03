import 'package:hive/hive.dart';

part 'tasks.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  final String name;
  @HiveField(1)
  bool isdone;

  Task({this.name, this.isdone});
  void toogleDone() {
    isdone = !isdone;
  }

  deleteAt(int index) {}

  void add(Task tasks) {}
}
