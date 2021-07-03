import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/models/tasks.dart';
import 'package:to_do/screens/tasks_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('todos');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
      home: Tasks_Screen(),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
// ChangeNotifierProvider(
//       create: (context) => TaskData(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         builder: BotToastInit(), //1. call BotToastInit
//         navigatorObservers: [BotToastNavigatorObserver()],
//         home: FutureBuilder(
//           future: Hive.openBox("tasks"),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               if (snapshot.hasError)
//                 return Text(snapshot.error.toString());
//               else
//                 return Tasks_Screen();
//             } else
//               return CircularProgressIndicator();
//           },
//         ),
//       ),
//     );