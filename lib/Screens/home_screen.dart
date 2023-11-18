import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/Login.dart';
import 'package:e_commerce/Screens/home/home_screen.dart';
import 'package:e_commerce/Services/database_services.dart';
import 'package:e_commerce/models/task.dart';
import 'package:e_commerce/models/tasks_data.dart';
import 'package:e_commerce/user/home_page.dart';
import '../task_tile.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task>? tasks;
  void getTasks() async {
    tasks = await DatabaseServices.getTasks();
    Provider.of<TasksData>(context, listen: false).tasks = tasks!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  Future refresh() async {
    setState(() {
      getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return tasks == null
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            backgroundColor: Color.fromRGBO(31, 44, 52, 1),
            appBar: AppBar(
              shadowColor: Color.fromRGBO(34, 192, 195, 1),
              elevation: 10,
              title: Text(
                'Products (${Provider.of<TasksData>(context).tasks.length})',
              ),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[
                    Color.fromRGBO(49, 62, 130, 1),
                    Color.fromRGBO(34, 192, 195, 1),
                  ]),
                ),
              ),
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Consumer<TasksData>(
                builder: (context, tasksData, child) {
                  return RefreshIndicator(
                    onRefresh: refresh,
                    child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                        itemCount: tasksData.tasks.length,
                        itemBuilder: (context, index) {
                          Task task = tasksData.tasks[index];

                          return TaskTile(
                            task: task,
                            tasksData: tasksData,
                          );
                        }),
                  );
                },
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: "btn1",
                  backgroundColor: Colors.green,
                  child: const Icon(
                    Icons.add,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                    // showModalBottomSheet(
                    //   context: context,
                    //   builder: (context) {
                    //     return const AddTaskScreen();
                    //   },
                    // );
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  heroTag: "btn2",
                  backgroundColor: Colors.green,
                  child: const Icon(
                    Icons.bar_chart,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              // HomeScreenn(Name: 'Test'),
                              HomePage(coms: tasks!)),
                    );
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  heroTag: "btn3",
                  backgroundColor: Colors.green,
                  child: const Icon(
                    Icons.next_plan,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreenn(Name: 'Test')),
                    );
                    HomeScreenn(Name: 'Test');
                  },
                ),
              ],
            ),
          );
  }
}
