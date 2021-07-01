import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task_data.dart';
import 'package:bot_toast/bot_toast.dart';

class TasksWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          padding: EdgeInsets.only(top: 15),
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          reverse: false,
          itemCount: Provider.of<TaskData>(context).tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskdata.tasks[index].name,
              isTrue: Provider.of<TaskData>(context).tasks[index].isdone,
              longpresscallback: () {
                taskdata.deleteTask(taskdata.tasks[index]);
                BotToast.showSimpleNotification(
                  title: "To Do List ☑️",
                  subTitle: 'Deleted the task Succesfully',
                  borderRadius: 10.0,
                );
              },
              checkBoxCallBack: (checkBoxState) {
                taskdata.updateTask(taskdata.tasks[index]);
              },
            );
          },
        );
      },
    );
  }
}
