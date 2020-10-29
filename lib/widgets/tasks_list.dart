import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/widgets/tasks_tile.dart';
import 'package:to_do/models/tasks.dart';

class TasksWidget extends StatefulWidget {
  final List<Task> tasks;
  TasksWidget({this.tasks});
  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        reverse: false,
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            taskTitle: widget.tasks[index].name,
            isTrue: widget.tasks[index].isdone,
            checkBoxCallBack: (checkboxState) {
              setState(() {
                widget.tasks[index].toogleDone();
              });
            },
          );
        });
  }
}
