class Task {
  final String name;
  bool isdone;
  Task({this.name, this.isdone});
  void toogleDone() {
    isdone = !isdone;
  }
}
