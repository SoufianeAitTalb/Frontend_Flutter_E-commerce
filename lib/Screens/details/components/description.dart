import 'package:flutter/material.dart';
// import 'package:e_commerce/models/Product.dart';
import 'package:e_commerce/models/task.dart';

import '../../../constants.dart';

class Description extends StatelessWidget {
  const Description({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        task.descreption,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
