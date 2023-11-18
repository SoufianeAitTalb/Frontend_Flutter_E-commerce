import 'package:flutter/cupertino.dart';

class Com {
  final int id;
  final String text;
  final String uname;
  final String idP;

  Com({
    required this.id,
    required this.text,
    required this.uname,
    required this.idP,
    // this.done = false,
  });
  factory Com.fromMap(Map taskMap) {
    return Com(
      id: taskMap['id'],
      text: taskMap['text'],
      uname: taskMap['uname'],
      idP: taskMap['idP'],
    );
    // void toggle() {
    //   done = !done;
    // }
  }
}
