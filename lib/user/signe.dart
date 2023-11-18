import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/Animation/FadeAnimation.dart';
import 'package:e_commerce/Screens/add_task_screen.dart';
import 'package:e_commerce/Screens/home/home_screen.dart';
import 'package:e_commerce/Screens/home_screen.dart';
import 'package:e_commerce/models/user_data.dart';
import 'package:e_commerce/user/log.dart';

// ignore: camel_case_types
class signe extends StatefulWidget {
  @override
  _logState createState() => _logState();
}

class _logState extends State<signe> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = PageController();

  String? _userEmail;

  String? _userPassword;

  String _userName = "";

  late File imageFile;

  late File _imageFile;

  bool IsLoaded = false;

  String _base64String = "";

  bool isV = false;
  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    setState(() {
      isV = isValid;
    });

    FocusScope.of(context).unfocus();

    if (!IsLoaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please pick an image.'),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      return;
    }
  }

  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        _imageFile = imageFile;
        IsLoaded = true;
        ToBase46();
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        _imageFile = imageFile;
        IsLoaded = true;
        ToBase46();
      });
    }
  }

  ToBase46() async {
    Uint8List _bytes = await _imageFile.readAsBytes();
    // base64 encode the bytes
    _base64String = base64.encode(_bytes);
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
                                "Signup",
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
                                "Welcom",
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
                                          GestureDetector(
                                            onTap: () {
                                              _getFromGallery();
                                            },
                                            child: Center(
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                child: IsLoaded ? Image.file(imageFile, fit: BoxFit.fill) : Image.asset('assets/images/a.png'),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            style: TextStyle(color: Colors.pinkAccent),
                                            key: ValueKey('email'),
                                            autocorrect: false,
                                            textCapitalization: TextCapitalization.none,
                                            enableSuggestions: false,
                                            validator: (value) {
                                              if (value!.isEmpty || !value.contains('@gmail.com')) {
                                                return 'Please enter a valid email address.';
                                              }
                                              return null;
                                            },
                                            keyboardType: TextInputType.emailAddress,
                                            decoration: InputDecoration(
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
                                              labelText: 'Email address',
                                            ),
                                            onChanged: (value) {
                                              _userEmail = value;
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
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
                                                'Signup',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                              onPressed: () {
                                                _trySubmit();
                                                if (isV && IsLoaded) {
                                                  Provider.of<UserData>(context, listen: false).addTask(_userEmail!, _userName, _userPassword!);

                                                  Navigator.pushAndRemoveUntil<dynamic>(
                                                    context,
                                                    MaterialPageRoute<dynamic>(
                                                      builder: (BuildContext context) => HomeScreenn(Name: _userName),
                                                    ),
                                                    (route) => false, //if you want to disable back feature set to false
                                                  );
                                                }
                                              }),
                                          SizedBox(height: 20),
                                          MaterialButton(
                                            textColor: Theme.of(context).primaryColor,
                                            child: Text(
                                              'I already have an account',
                                              style: TextStyle(color: Colors.purple[800]),
                                            ),
                                            onPressed: () {
                                              Navigator.pushAndRemoveUntil<dynamic>(
                                                context,
                                                MaterialPageRoute<dynamic>(
                                                  builder: (BuildContext context) => log(),
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
