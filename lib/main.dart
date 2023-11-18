import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/Screens/add_task_screen.dart';
import 'package:e_commerce/choose.dart';
import 'package:e_commerce/login.dart';
import 'package:e_commerce/models/tasks_data.dart';

import 'package:e_commerce/user/home_page.dart';
import 'package:e_commerce/user/log.dart';
import 'package:e_commerce/user/signe.dart';

import 'Screens/home/home_screen.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return ChangeNotifierProvider<TasksData>(
      create: (context) => TasksData(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Choose()
          // HomePage(),
          // HomeScreen(),
          // HomeScreenn(Name: "Test"),
          // log(),
          // signe()
          // AddTaskScreen()
          // login()
          // ChatPage(),
          ),
    );
  }
}
