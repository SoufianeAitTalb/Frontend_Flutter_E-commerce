import 'dart:convert';
//import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:e_commerce/models/ToImage.dart';
import 'package:e_commerce/models/comments.dart';
import 'package:e_commerce/models/getcolor.dart';
import 'package:e_commerce/models/task.dart';
import 'package:e_commerce/models/user.dart';

import 'globals.dart';

class DatabaseServices {
  static toImage im = new toImage();
  static Coll c = new Coll();
  static Future<Task> addTask(String title, String descreption, String image, int price, double size, String type, int TB) async {
    Map data = {
      "title": title,
      "descreption": descreption,
      "image": image,
      "price": price,
      "size": size,
      "type": type,
      "tb": TB,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/add');

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    Map responseMap = jsonDecode(response.body);
    Task task = Task.fromMap(responseMap);

    return task;
  }

  static Future<List<Task>> getTasks() async {
    var url = Uri.parse(baseURL);
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    print(response.body);
    List responseList = jsonDecode(response.body);
    List<Task> tasks = [];
    for (Map taskMap in responseList) {
      Task task = Task.fromMap(taskMap);
      task.img = await im.tr(task);
      task.col = await c.getImagePalette(task);
      tasks.add(task);
    }
    return tasks;
  }

  static Future<http.Response> updateTask(int id, int TB) async {
    var url = Uri.parse(baseURL + '/update/$id');
    http.Response response = await http.put(url,
        headers: headers,
        body: json.encode({
          'TB': TB,
        }));
    print(response.body);
    return response;
  }

  static Future<http.Response> deleteTask(int id) async {
    var url = Uri.parse(baseURL + '/delete/$id');
    http.Response response = await http.delete(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }
//!..............................................................................................................................

  static Future<User> addUser(String email, String name, String password) async {
    Map data = {
      "email": email,
      "name": name,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/user/add');

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    Map responseMap = jsonDecode(response.body);
    User user = User.fromMap(responseMap);

    return user;
  }

  static Future<List<User>> getUsers() async {
    var url = Uri.parse(baseURL + '/GU');
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    print(response.body);
    List responseList = jsonDecode(response.body);
    List<User> users = [];
    for (Map userMap in responseList) {
      User user = User.fromMap(userMap);

      users.add(user);
    }
    return users;
  }

  //!.........................................................................

  static Future<Com> addCom(String text, String uname, String idP) async {
    Map data = {
      "text": text,
      "uname": uname,
      "idP": idP,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/comments/add');

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    Map responseMap = jsonDecode(response.body);
    Com com = Com.fromMap(responseMap);

    return com;
  }

  static Future<List<Com>> getCom() async {
    var url = Uri.parse(baseURL + "/comments");
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    print(response.body);
    List responseList = jsonDecode(response.body);
    List<Com> coms = [];
    for (Map ComMap in responseList) {
      Com com = Com.fromMap(ComMap);

      coms.add(com);
    }
    return coms;
  }
  //!...................................................................

}
