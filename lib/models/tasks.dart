class Task {
  final String name;
  bool isdone;
  Task({this.name, this.isdone});
  void toogleDone() {
    isdone = !isdone;
  }

  Task.fromMap(Map map)
      : this.name = map['name'],
        this.isdone = map['isdone'];

  Map toMap() {
    return {
      'name': this.name,
      'isdone': this.isdone,
    };
  }
}
