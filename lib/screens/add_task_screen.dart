import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task_data.dart';
import 'package:bot_toast/bot_toast.dart';

// ignore: camel_case_types
class Add_Task_screen extends StatelessWidget {
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
            Text('Add a new task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepOrange,
                )),
            CupertinoTextField(
              textCapitalization: TextCapitalization.sentences,
              scrollPhysics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTaskTitle = value;
              },
              onSubmitted: (newTaskTitle) {
                if (newTaskTitle == null) {
                  Navigator.pop(context);
                } else {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
                  BotToast.showSimpleNotification(
                    title: "To Do List",
                    subTitle: 'Addded the task Succesfully',
                    borderRadius: 10.0,
                  );
                  Navigator.pop(context);
                  print(newTaskTitle);
                }
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange[50],
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              width: double.infinity,
              child: TextButton(
                // color: Colors.deepOrange,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.deepOrange,
                  textStyle: const TextStyle(fontSize: 20),
                ),

                onPressed: () {
                  if (newTaskTitle == null) {
                    Navigator.pop(context);
                  } else {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);
                    BotToast.showSimpleNotification(
                      title: "To Do List",
                      subTitle: 'Addded the task Succesfully',
                      borderRadius: 10.0,
                    );
                    Navigator.pop(context);
                    print(newTaskTitle);
                  }
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
