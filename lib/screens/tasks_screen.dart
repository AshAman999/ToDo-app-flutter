import 'package:flutter/material.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/screens/custom_dialog.dart';
import 'package:to_do/widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';

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
              leading: Icon(Icons.check_box_outline_blank_rounded),
              title: Text('Check All'),
              enabled: true,
              onTap: () {
                print("hello");
              },
            ),
            ListTile(
              onTap: null,
              leading: Icon(Icons.check_box_outline_blank),
              title: Text('UnCheck All'),
            ),
            ListTile(
              onTap: null,
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
                        title: "Aman Raj",
                        descriptions:
                            "Hey there! This app will help you in keeping track of your bucket list work,it's simple to use. If you wannt to add a task press the + icon button and fill the text field with your task name, you can toogle the checkbox of each task, also to delte any task you just need to swipe left or swipe right. A Big thanks to all the answers on stackoverflow and to the flutter cook-book itself without which i couldn'd have made this app usable ",
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
