import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isTrue;
  final String taskTitle;
  final Function checkBoxCallBack;
  final Function longpresscallback;

  const TaskTile(
      {this.isTrue,
      this.taskTitle,
      this.checkBoxCallBack,
      this.longpresscallback});
  // void checkBoxCallback(bool checkBoxstate) {
  //   // setState(() {
  //   //   isTrue = checkBoxstate;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
            leading: Icon(
              Icons.menu_outlined,
              color: Colors.deepOrange,
              size: 18,
            ),
            onLongPress: longpresscallback,
            contentPadding: EdgeInsets.fromLTRB(15.0, 4.0, 5.0, 4.0),
            title: Transform(
              transform: Matrix4.translationValues(-30, 0.0, 0.0),
              child: Text(
                taskTitle,
                style: TextStyle(
                  decoration: isTrue ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
            trailing: Checkbox(
              activeColor: Colors.deepOrange,
              value: isTrue,
              onChanged: checkBoxCallBack,
            )),
      ),
    );
  }
}
