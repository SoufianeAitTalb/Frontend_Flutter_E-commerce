import 'package:flutter/cupertino.dart';

import 'package:e_commerce/Services/database_services.dart';
import 'package:e_commerce/models/comments.dart';

class CommentData extends ChangeNotifier {
  List<Com> Coms = [];
  void addTask(String text, String uname, String idP) async {
    Com com = await DatabaseServices.addCom(text, uname, idP);
    Coms.add(com);
    notifyListeners();
  }
}
