import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:to_do/models/tasks.dart';

class TasksWidget extends StatefulWidget {
  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  List<Task> tasks = [
    Task(name: 'eat bread'),
    Task(name: 'eat cookie'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      reverse: false,
      children: [
        Container(
          child: Text('heelo'),
        )
      ],
    );
  }
}
