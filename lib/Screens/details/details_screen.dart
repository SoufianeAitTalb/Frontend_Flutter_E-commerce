import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:e_commerce/Screens/Comments.dart';
import 'package:e_commerce/constants.dart';
// import 'package:e_commerce/models/Product.dart';
import 'package:e_commerce/models/task.dart';

import 'components/bod.dart';

class DetailsScreen extends StatelessWidget {
  final Task task;
  final String name;
  const DetailsScreen({Key? key, required this.task, required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color

      backgroundColor: Color.fromARGB(task.col.alpha, task.col.red, task.col.green, task.col.blue),
      appBar: buildAppBar(context),
      body: Bod(task: task, name: name),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(task.col.alpha, task.col.red, task.col.green, task.col.blue),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
