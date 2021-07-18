import 'package:flutter/cupertino.dart';
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
      child: AnimatedContainer(
        duration: Duration(seconds: 5),
        curve: Curves.bounceIn,
        margin: EdgeInsets.all(10.5),
        decoration: BoxDecoration(
          color: isTrue ? Colors.black54 : Colors.lightGreenAccent,
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
        child: GridTile(
          footer: GridTileBar(
            leading: Switch(
              activeColor: Colors.blue,
              inactiveThumbColor: Colors.white.withOpacity(0.8),
              inactiveTrackColor: Colors.grey,
              value: isTrue,
              onChanged: checkBoxCallBack,
            ),
            title: SizedBox(
              width: 10,
            ),
            trailing: GestureDetector(
              onTap: longpresscallback,
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                margin: EdgeInsets.only(bottom: 16.0),
                height: 160,
                width: 160,
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Center(
                        child: Text(
                      taskTitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        decoration: isTrue ? TextDecoration.lineThrough : null,
                      ),
                    )),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//  ListTile(
//             leading: Icon(
//               Icons.menu_outlined,
//               color: Colors.deepOrange[300],
//             ),
//             // onLongPress: longpresscallback,
//             contentPadding: EdgeInsets.fromLTRB(15.0, 4.0, 5.0, 4.0),
//             title: Transform(
//               transform: Matrix4.translationValues(-20, 0.0, 0.0),
//               child: Text(
//                 taskTitle,
//                 style: TextStyle(
//                   decoration: isTrue ? TextDecoration.lineThrough : null,
//                 ),
//               ),
//             ),
//             trailing: Checkbox(
//               activeColor: Colors.deepOrange,
//               value: isTrue,
//               onChanged: checkBoxCallBack,
//             )),