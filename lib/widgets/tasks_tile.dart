import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isTrue;
  final String taskTitle;
  final Function checkBoxCallBack;

  const TaskTile({this.isTrue, this.taskTitle, this.checkBoxCallBack});
  // void checkBoxCallback(bool checkBoxstate) {
  //   // setState(() {
  //   //   isTrue = checkBoxstate;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.lightBlueAccent,
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: Offset(
                4.0,
                3.0,
              ), // shadow direction: bottom right
            )
          ],
        ),
        child: ListTile(
            contentPadding: EdgeInsets.all(5.0),
            title: Text(
              taskTitle,
              style: TextStyle(
                decoration: isTrue ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Checkbox(
              activeColor: Colors.lightBlueAccent,
              value: isTrue,
              onChanged: checkBoxCallBack,
            )),
      ),
    );
  }
}
