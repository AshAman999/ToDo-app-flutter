import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/models/tasks.dart';
import 'package:to_do/widgets/tasks_tile.dart';
import 'package:bot_toast/bot_toast.dart';

class TasksWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Task>('todos').listenable,
      builder: (context, Box<Task> box, child) {
        if (box.values.isEmpty) {
          return Center(
            child: Text("No data available!",
                style: TextStyle(fontFamily: 'Montserrat')),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.only(top: 15),
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          reverse: false,
          itemCount: box.length,
          itemBuilder: (context, index) {
            Task task = box.getAt(index);
            return Dismissible(
              direction: DismissDirection.horizontal,
              key: UniqueKey(),
              background: Container(
                margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Icon(
                        Icons.delete,
                        size: 30,
                      ),
                    ),
                    Text(
                      "Delete ?",
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
              secondaryBackground: Container(
                margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Delete ?",
                      style: TextStyle(),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Icon(
                        Icons.delete,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              onDismissed: (direction) async {
                await box.deleteAt(index);
                BotToast.showSimpleNotification(
                  title: "To Do List ☑️",
                  subTitle: 'Deleted the task Succesfully',
                  borderRadius: 10.0,
                );
              },
              child: TaskTile(
                taskTitle: task.name,
                isTrue: task.isdone,
                // longpresscallback: () {
                //   task.deleteTask(taskdata.tasks[index]);
                //   BotToast.showSimpleNotification(
                //     title: "To Do List ☑️",
                //     subTitle: 'Deleted the task Succesfully',
                //     borderRadius: 10.0,
                //   );
                // },
                checkBoxCallBack: (checkBoxState) {
                  task.toogleDone();
                },
              ),
            );
          },
        );
      },
    );
  }
}
