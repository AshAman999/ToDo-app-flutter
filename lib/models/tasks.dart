class Task {
  final String name;
  bool isdone;
  Task({this.name, this.isdone = false});
  void toogleDone() {
    isdone = !isdone;
  }
}
