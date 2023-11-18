import 'package:flutter/cupertino.dart';

class Task {
  final int id;
  final String title;
  // bool done;
  final String descreption;
  final String image;
  final int price;
  final double size;
  final String type;
  final int tb;
  Image img;
  Color col;

  Task(
      {required this.id,
      required this.title,
      // this.done = false,
      required this.descreption,
      required this.image,
      required this.price,
      required this.size,
      required this.type,
      required this.img,
      required this.col,
      required this.tb});
  factory Task.fromMap(Map taskMap) {
    return Task(
        id: taskMap['id'],
        descreption: taskMap['descreption'],
        title: taskMap['title'],
        // done: taskMap['done'],
        price: taskMap['price'],
        image: taskMap['image'],
        size: taskMap['size'],
        type: taskMap['type'],
        img: taskMap['img'],
        col: taskMap['col'],
        tb: taskMap['tb']);
    // void toggle() {
    //   done = !done;
    // }
  }
}
