import 'package:flutter/material.dart';
import 'package:e_commerce/models/task.dart';
import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Task task;
  final VoidCallback press;
  const ItemCard({
    Key? key,
    required this.task,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: Color.fromARGB(task.col.alpha - 50, task.col.red, task.col.green, task.col.blue),
                // HexColor(task.color),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${task.id}",
                child: task.img,
                // Provider.of<toImage>(context, listen: true).tr(_myFile, task),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
              child: Text(
                // products is out demo list
                task.price.toString() + " \$",
                style: TextStyle(color: kTextLightColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
