import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/Animation/FadeAnimation.dart';
import 'package:e_commerce/Screens/add_task_screen.dart';
import 'package:e_commerce/Screens/home/home_screen.dart';
import 'package:e_commerce/models/checkuser.dart';
import 'package:e_commerce/models/user_data.dart';
import 'package:e_commerce/user/signe.dart';

// ignore: camel_case_types
class log extends StatefulWidget {
  @override
  _logState createState() => _logState();
}

class _logState extends State<log> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = PageController();

  String _userPassword = "";

  String _userName = "";

  bool isV = false;
  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    isV = isValid;
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    // bool _isLogin = true;
    return ChangeNotifierProvider<UserData>(
      create: (_) => UserData(),
      builder: (context, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Color.fromRGBO(4, 14, 63, 1),
                  // Color.fromRGBO(150, 28, 139, 1),
                  Color.fromRGBO(37, 76, 135, 1),
                  // Colors.green[100],
                ],
              ),
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
                          SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                              1,
                              Text(
                                "Login",
                                style: TextStyle(color: Colors.white.withOpacity(1), fontSize: 40),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                            1.3,
                            Padding(
                              padding: EdgeInsets.only(left: 60),
                              child: Text(
                                "Welcom Again",
                                style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 30),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 20),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // color: Color.fromRGBO(150, 28, 139, 1),
                          color: Color.fromRGBO(31, 44, 52, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          ),
                        ),
                      ),
                      Container(
                        // color: Colors.green,
                        height: double.infinity,
                        /** Card Widget **/

                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            // color: Colors.green,
                            decoration: new BoxDecoration(
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 30.0,
                                  spreadRadius: -20,
                                ),
                              ],
                            ),
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                              child: Card(
                                // elevation: 15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.transparent,
                                margin: EdgeInsets.all(20),
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("assets/images/Layer1.png"), fit: BoxFit.cover),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          // UserImagePicker(_pickedImage),

                                          SizedBox(
                                            height: 30,
                                          ),

                                          TextFormField(
                                            style: TextStyle(color: Colors.pinkAccent),
                                            key: ValueKey('username'),
                                            autocorrect: true,
                                            textCapitalization: TextCapitalization.words,
                                            enableSuggestions: false,
                                            validator: (value) {
                                              if (value!.isEmpty || value.length < 4) {
                                                return 'Please enter at least 4 characters';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Username',
                                              labelStyle: TextStyle(
                                                color: Colors.white, //<-- SEE HERE
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color.fromRGBO(37, 76, 135, 1),
                                                ),
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color.fromRGBO(37, 76, 135, 1),
                                                ),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              _userName = value;
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            style: TextStyle(color: Colors.pinkAccent),
                                            key: ValueKey('password'),
                                            validator: (value) {
                                              if (value!.isEmpty || value.length < 7) {
                                                return 'Password must be at least 7 characters long.';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                              labelStyle: TextStyle(
                                                color: Colors.white, //<-- SEE HERE
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color.fromRGBO(37, 76, 135, 1),
                                                ),
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color.fromRGBO(37, 76, 135, 1),
                                                ),
                                              ),
                                            ),
                                            obscureText: true,
                                            onChanged: (value) {
                                              _userPassword = value;
                                            },
                                          ),
                                          SizedBox(height: 20),

                                          MaterialButton(
                                            color: Color.fromRGBO(4, 14, 63, 1),
                                            child: Text(
                                              'Login',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            onPressed: () async {
                                              _trySubmit();
                                              if (isV) {
                                                User user = User(username: _userName, password: _userPassword);
                                                if (await user.checkLogin()) {
                                                  print("logged in successfully");
                                                  Navigator.pushAndRemoveUntil<dynamic>(
                                                    context,
                                                    MaterialPageRoute<dynamic>(
                                                      builder: (BuildContext context) => HomeScreenn(Name: _userName),
                                                    ),
                                                    (route) => false, //if you want to disable back feature set to false
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text("Invalid username or password"),
                                                      backgroundColor: Theme.of(context).errorColor,
                                                    ),
                                                  );
                                                }
                                                print("Invalid username or password");
                                              }
                                            },
                                          ),
                                          SizedBox(height: 20),
                                          MaterialButton(
                                            textColor: Theme.of(context).primaryColor,
                                            child: Text(
                                              'Creat new account',
                                              style: TextStyle(color: Colors.purple[800]),
                                            ),
                                            onPressed: () {
                                              Navigator.pushAndRemoveUntil<dynamic>(
                                                context,
                                                MaterialPageRoute<dynamic>(
                                                  builder: (BuildContext context) => signe(),
                                                ),
                                                (route) => false, //if you want to disable back feature set to false
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Card(
                        //   elevation: 20,
                        //   shadowColor: Colors.black,
                        //   color: Colors.transparent,
                        //   //! fit the image to matck the card corner radius
                        //   semanticContainer: true,
                        //   clipBehavior: Clip.antiAliasWithSaveLayer,
                        //   child: Container(
                        //       // width: 100,
                        //       decoration: BoxDecoration(
                        //         image: DecorationImage(image: AssetImage("assets/images/Layer1.png"), fit: BoxFit.cover),
                        //       ),
                        //       child: Column(
                        //         children: [Text('loai')],
                        //       )),
                        //   //SizedBox
                        // ), //Card
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
