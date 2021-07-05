import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/screens/custom_dialog.dart';
import 'package:to_do/widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: camel_case_types
class Tasks_Screen extends StatelessWidget {
// ignore: camel_case_types
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        // title: Text(
        //   "aman",
        //   style: TextStyle(color: Colors.black),
        // ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              currentAccountPictureSize: Size.fromRadius(35),
              accountName: Text(
                "To Do",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text("Your own personal ToDo"),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  child: Image(
                    image: AssetImage("assets/logo_transparent.png"),
                  )),
            ),
            ListTile(
              leading: Icon(Icons.check_box),
              title: Text('Check All'),
              enabled: true,
              onTap: () {
                Alert(
                  context: context,
                  type: AlertType.warning,
                  title: "To Do List 📝",
                  desc:
                      "This is irreversible, you might end up checking all your tasks listed here. Are you sure ?",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "NO",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: Color.fromRGBO(0, 179, 134, 1.0),
                    ),
                    DialogButton(
                      child: Text(
                        "YES",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        checkAll(context);
                      },
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(116, 116, 191, 1.0),
                        Color.fromRGBO(52, 138, 199, 1.0)
                      ]),
                    )
                  ],
                ).show();
              },
            ),
            ListTile(
              onTap: () {
                Alert(
                  context: context,
                  type: AlertType.warning,
                  title: "To Do List 📝",
                  desc:
                      "This is irreversible, you might end up unchecking  all your tasks listed here. Are you sure ?",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "NO",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: Color.fromRGBO(0, 179, 134, 1.0),
                    ),
                    DialogButton(
                      child: Text(
                        "YES",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        uncheckAll(context);
                      },
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(116, 116, 191, 1.0),
                        Color.fromRGBO(52, 138, 199, 1.0)
                      ]),
                    )
                  ],
                ).show();
              },
              leading: Icon(Icons.check_box_outline_blank_rounded),
              title: Text('UnCheck All'),
            ),
            ListTile(
              onTap: () {
                Alert(
                  context: context,
                  type: AlertType.warning,
                  title: "To Do List 📝",
                  desc:
                      "This is irreversible, you might end up losing all your tasks listed here. Are you sure ?",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "NO",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: Color.fromRGBO(0, 179, 134, 1.0),
                    ),
                    DialogButton(
                      child: Text(
                        "YES",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        dAll(context);
                      },
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(116, 116, 191, 1.0),
                        Color.fromRGBO(52, 138, 199, 1.0)
                      ]),
                    )
                  ],
                ).show();
              },
              leading: Icon(Icons.delete),
              title: Text('Delete All'),
            ),
            ListTile(
              onTap: null,
              leading: Icon(Icons.color_lens_sharp),
              title: Text('Change Theme'),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialogBox(
                        title: "To Do",
                        descriptions:
                            ' 📝 A simple ad free To Do App\n 📝 Press the add icon button to add a task\n 📝swipe left or right on any task to delete\n 📝Check or Uncheck any task\n 📝Delete all task at once\n 📝Check all tasks at once \n 📝Customize your own theme',
                        text: "Check GitHub",
                      );
                    });
              },
              leading: Icon(Icons.info),
              title: Text('About'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.deepOrange,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('button pressed');
          showModalBottomSheet(
              context: context, builder: (context) => Add_Task_screen());
        },
        elevation: 12.0,
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 10.0, left: 30, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     Scaffold.of(context).openDrawer();
                  //   },
                  //   child: CircleAvatar(
                  //     foregroundColor: Colors.deepOrange,
                  //     radius: 30.0,
                  //     child: Icon(
                  //       Icons.list,
                  //       size: 30.0,
                  //     ),
                  //     backgroundColor: Colors.white,
                  //   ),
                  // ),

                  Text(
                    "To Do",
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).tasks.length} tasks left',
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
                child: TasksWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void dAll(BuildContext context) {
  Provider.of<TaskData>(context, listen: false).deleteAll();
  BotToast.showSimpleNotification(
    title: "To Do List 📝",
    subTitle: 'All task Deleted Succesfully ',
    borderRadius: 10.0,
  );
  Navigator.pop(context);
}

void checkAll(BuildContext context) {
  Provider.of<TaskData>(context, listen: false).checkAll();
  BotToast.showSimpleNotification(
    title: "To Do List 📝",
    subTitle: 'All task Checked Succesfully ',
    borderRadius: 10.0,
  );
  Navigator.pop(context);
}

void uncheckAll(BuildContext context) {
  Provider.of<TaskData>(context, listen: false).uncheckAll();
  BotToast.showSimpleNotification(
    title: "To Do List 📝",
    subTitle: 'All task UnChecked Succesfully ',
    borderRadius: 10.0,
  );
  Navigator.pop(context);
}
