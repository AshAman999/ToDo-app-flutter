import 'package:flutter/material.dart';
import 'package:to_do/widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:to_do/models/tasks.dart';

List<Task> tasks = [];

// ignore: camel_case_types
class Tasks_Screen extends StatefulWidget {
  @override
  _Tasks_ScreenState createState() => _Tasks_ScreenState();
}

// ignore: camel_case_types
class _Tasks_ScreenState extends State<Tasks_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('button pressed');
          showModalBottomSheet(
              context: context,
              builder: (context) => Add_Task_screen(
                    addTaskCallBack: (newTaskTitle) {
                      setState(() {
                        if (newTaskTitle != null)
                          tasks.add(Task(name: newTaskTitle));
                        Navigator.pop(context);
                      });
                      print(newTaskTitle);
                    },
                  ));
        },
        elevation: 12.0,
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 50.0, left: 30, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    foregroundColor: Colors.lightBlueAccent,
                    radius: 30.0,
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "To Do",
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${tasks.length} tasks left',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: TasksWidget(
                  tasks: tasks,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
