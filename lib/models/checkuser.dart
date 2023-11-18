import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:e_commerce/Services/globals.dart';

class User {
  String username;
  String password;

  User({required this.username, required this.password});

  Future<bool> checkLogin() async {
    final response = await http.post(
      baseURL + '/login',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({'name': username, 'password': password}),
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);

      return responseJson['isValid'];
    } else {
      return false;
    }
  }
}
