import 'package:flutter/material.dart';

import 'models/task.dart';
import 'models/tasks_data.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final TasksData tasksData;
  const TaskTile({
    Key? key,
    required this.task,
    required this.tasksData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(task);
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.transparent,
      child: Container(
        // color: Colors.white10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(image: AssetImage("assets/images/Layer1.png"), fit: BoxFit.cover),
        ),
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       Color.fromRGBO(49, 62, 130, 1),
        //       Color.fromRGBO(150, 28, 139, 1),
        //       Color.fromRGBO(34, 192, 195, 1),
        //       // Colors.green[100],
        //     ],
        //   ),
        // ),
        child: task.img == null
            ? CircularProgressIndicator()
            : ListTile(
                leading: Container(width: 100, child: Image(image: task.img.image)),
                title: Text(
                  task.title,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                subtitle: Text(
                  task.price.toString() + "\$",
                  style: TextStyle(color: Colors.yellow),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    tasksData.deleteTask(task);
                  },
                ),
              ),
      ),
    );
  }
}
