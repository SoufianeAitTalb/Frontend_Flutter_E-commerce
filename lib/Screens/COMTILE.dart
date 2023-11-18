import 'package:flutter/material.dart';
import 'package:e_commerce/models/comments.dart';
import 'package:e_commerce/models/comments_data.dart';

class COMTILE extends StatelessWidget {
  final Com com;
  final CommentData commentData;
  const COMTILE({
    Key? key,
    required this.com,
    required this.commentData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       Color.fromRGBO(49, 62, 130, 1),
        //       // Color.fromRGBO(150, 28, 139, 1),
        //       Color.fromRGBO(34, 192, 195, 1),
        //       // Colors.green[100],
        //     ],
        //   ),
        // ),
        child: ListTile(
          leading: Text(
            com.uname,
            style: TextStyle(color: Colors.yellowAccent, fontSize: 20),
          ),
          title: Text(
            "Date",
            style: TextStyle(color: Colors.blue[100]),
          ),
          subtitle: Text(
            com.text,
            style: TextStyle(color: Colors.white),
          ),
          // trailing: IconButton(
          //   icon: const Icon(Icons.clear),
          //   onPressed: () {
          //     tasksData.deleteTask(task);
          //   },
          // ),
        ),
      ),
    );
  }
}
