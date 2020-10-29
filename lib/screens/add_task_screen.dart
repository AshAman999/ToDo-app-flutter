import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/models/tasks.dart';
import 'package:to_do/screens/tasks_screen.dart';

// ignore: camel_case_types
class Add_Task_screen extends StatelessWidget {
  final Function addTaskCallBack;

  const Add_Task_screen({Key key, this.addTaskCallBack}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding:
            EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0, bottom: 20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            CupertinoTextField(
              autocorrect: true,
              scrollPhysics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTaskTitle = value;
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            FlatButton(
                color: Colors.lightBlueAccent,
                onPressed: () {
                  addTaskCallBack(newTaskTitle);

                  print(newTaskTitle);
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
