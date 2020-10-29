import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isTrue = true;
  void checkBoxCallback(bool checkBoxstate) {
    // setState(() {
    //   isTrue = checkBoxstate;
    // });
  }

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
            'this is a task',
            style: TextStyle(
              decoration: isTrue ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: TaskCheckBox(
            toogleCheckBox: checkBoxCallback,
            checkBoxState: isTrue,
          ),
        ),
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkBoxState;
  final Function toogleCheckBox;
  TaskCheckBox({this.checkBoxState, @required this.toogleCheckBox});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkBoxState,
      onChanged: toogleCheckBox,
    );
  }
}
