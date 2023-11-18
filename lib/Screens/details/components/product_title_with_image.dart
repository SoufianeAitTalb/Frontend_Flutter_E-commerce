import 'package:flutter/material.dart';

import 'package:e_commerce/models/task.dart';

import '../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            task.type,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            task.title,
            style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${task.price}",
                      style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${task.id}",
                  child: FittedBox(
                    child: task.img,
                    fit: BoxFit.fill,
                  ),
                  // Image.asset(
                  //   "assets/images/bag_1.png",
                  //   fit: BoxFit.fill,
                  // ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
