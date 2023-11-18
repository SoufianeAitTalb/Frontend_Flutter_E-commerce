import 'package:flutter/material.dart';
import 'package:e_commerce/Screens/add_task_screen.dart';

import 'Animation/FadeAnimation.dart';

// ignore: camel_case_types
class login extends StatelessWidget {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.centerLeft, colors: <Color>[
            Color.fromRGBO(34, 192, 195, 1),
            Color.fromRGBO(49, 62, 130, 1),
          ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeAnimation(
                          1,
                          Text(
                            "Add",
                            style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 40),
                          )),
                      FadeAnimation(
                          1.3,
                          Padding(
                            padding: EdgeInsets.only(left: 60),
                            child: Text(
                              "Product",
                              style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 30),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  // color: Color.fromRGBO(150, 28, 139, 1),
                  color: Color.fromRGBO(31, 44, 52, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: AddTaskScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
