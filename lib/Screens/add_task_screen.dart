import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tflite/tflite.dart';
import 'package:e_commerce/Screens/home_screen.dart';
import 'package:e_commerce/models/getcolor.dart';
import 'package:e_commerce/models/tasks_data.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'home/home_screen.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskTitle = "";
  String discreption = "";
  String image = "";
  int price = 0;
  double size = 6.4;
  String type = "";
  late File imageFile;
  late File _imageFile;
  bool IsLoaded = false;
  String _base64String = "";
  int TB = 0;
  //!..........................................................................................

  // File? image;
  bool _loading = false;
  List? _outputs;

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

//! "It is ${_outputs![0]["label"]}",

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _outputs = output!;
      type = _outputs![0]["label"].split(' ')[1];
      print(output);
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  //!..........................................................................................

  /// Get from gallery
  /// Get from gallery
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        _imageFile = imageFile;
        IsLoaded = true;
        ToBase46();
      });
    }

    classifyImage(imageFile);
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
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
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Center(
        child: SizedBox(
          width: 330,
          height: 550,
          child: Card(
            color: Colors.transparent,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 30,
            child: Container(
              // color: Color.fromRGBO(34, 192, 195, 1),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(34, 192, 195, 1),
                    Color.fromRGBO(49, 62, 130, 1),
                    // Color.fromRGBO(150, 28, 139, 1),

                    // Colors.green[100],
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Image.asset(
                  //   'assets/images/back.jpg',
                  //   fit: BoxFit.fill,
                  // ),
                  Container(
                    // padding: const EdgeInsets.only(right: 20, left: 20),
                    child: ListView(
                      physics: const BouncingScrollPhysics(), // new
                      children: [
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
                        Center(child: Container(child: Text(_outputs == null ? 'select an image' : _outputs![0]["label"].split(' ')[1]))),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ),
                              labelText: 'Name',
                              hintText: 'Enter Name of product',
                            ),
                            autofocus: true,
                            onChanged: (val) {
                              taskTitle = val;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: TextField(
                            maxLines: 5,
                            autofocus: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ),
                              labelText: 'discreption',
                              hintText: 'discribe your product',
                            ),
                            onChanged: (val) {
                              discreption = val;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ),
                              labelText: 'price',
                              hintText: 'give a price to your product',
                            ),
                            onChanged: (val) {
                              price = int.parse(val);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ),
                              labelText: 'size',
                              hintText: 'Type your product size',
                            ),
                            onChanged: (val) {
                              size = double.parse(val);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // TextField(
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(
                        //       borderSide: BorderSide(),
                        //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        //     ),
                        //     labelText: 'size',
                        //     hintText: 'Type your product size',
                        //   ),
                        //   autofocus: true,
                        //   onChanged: (val) {
                        //     type = val;
                        //   },
                        // )
// !.................................................................
                        // Container(
                        //   child: SingleChildScrollView(
                        //     padding: EdgeInsets.only(right: 20),
                        //     physics: const BouncingScrollPhysics(),
                        //     scrollDirection: Axis.horizontal,
                        //     child: Row(
                        //       children: [
                        //         GestureDetector(
                        //           onTap: () {
                        //             setState(() {
                        //               type = "watch";
                        //             });
                        //           },
                        //           child: Column(
                        //             children: [
                        //               Container(
                        //                 width: 70,
                        //                 height: 70,
                        //                 decoration: BoxDecoration(
                        //                   color: type == 'watch' ? Colors.blue.withOpacity(0.3) : Colors.white.withOpacity(0.3),
                        //                   borderRadius: BorderRadius.circular(16),
                        //                 ),
                        //                 child: Padding(
                        //                   padding: const EdgeInsets.all(16.0),
                        //                   child: Icon(Icons.watch),
                        //                 ),
                        //               ),
                        //               SizedBox(height: 5),
                        //               Text("Watch"),
                        //             ],
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           width: 10,
                        //         ),
                        //         GestureDetector(
                        //           onTap: () {
                        //             setState(() {
                        //               type = "bag";
                        //             });
                        //           },
                        //           child: Column(
                        //             children: [
                        //               Container(
                        //                 width: 70,
                        //                 height: 70,
                        //                 decoration: BoxDecoration(
                        //                   color: type == 'bag' ? Colors.blue.withOpacity(0.3) : Colors.white.withOpacity(0.3),
                        //                   borderRadius: BorderRadius.circular(16),
                        //                 ),
                        //                 child: Padding(
                        //                   padding: const EdgeInsets.all(16.0),
                        //                   child: Image.asset('assets/images/bag.png', fit: BoxFit.fill),
                        //                 ),
                        //               ),
                        //               SizedBox(height: 5),
                        //               Text("Bag"),
                        //             ],
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           width: 10,
                        //         ),
                        //         GestureDetector(
                        //           onTap: () {
                        //             setState(() {
                        //               type = "shoe";
                        //             });
                        //           },
                        //           child: Column(
                        //             children: [
                        //               Container(
                        //                 width: 70,
                        //                 height: 70,
                        //                 decoration: BoxDecoration(
                        //                   color: type == 'shoe' ? Colors.blue.withOpacity(0.3) : Colors.white.withOpacity(0.3),
                        //                   borderRadius: BorderRadius.circular(16),
                        //                 ),
                        //                 child: Padding(
                        //                   padding: const EdgeInsets.all(16.0),
                        //                   child: Image.asset('assets/images/shoe.png', fit: BoxFit.fill),
                        //                 ),
                        //               ),
                        //               SizedBox(height: 5),
                        //               Text("shoe"),
                        //             ],
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           width: 10,
                        //         ),
                        //         GestureDetector(
                        //           onTap: () {
                        //             setState(() {
                        //               type = "shirt";
                        //             });
                        //           },
                        //           child: Column(
                        //             children: [
                        //               Container(
                        //                 width: 70,
                        //                 height: 70,
                        //                 decoration: BoxDecoration(
                        //                   color: type == 'shirt' ? Colors.blue.withOpacity(0.3) : Colors.white.withOpacity(0.3),
                        //                   borderRadius: BorderRadius.circular(16),
                        //                 ),
                        //                 child: Padding(
                        //                   padding: const EdgeInsets.all(16.0),
                        //                   child: Image.asset('assets/images/T-shirt.png', fit: BoxFit.fill),
                        //                 ),
                        //               ),
                        //               SizedBox(height: 5),
                        //               Text("t-shirt"),
                        //             ],
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           width: 10,
                        //         ),
                        //         GestureDetector(
                        //           onTap: () {
                        //             setState(() {
                        //               type = "pants";
                        //             });
                        //           },
                        //           child: Column(
                        //             children: [
                        //               Container(
                        //                 width: 70,
                        //                 height: 70,
                        //                 decoration: BoxDecoration(
                        //                   color: type == 'pants' ? Colors.blue.withOpacity(0.3) : Colors.white.withOpacity(0.3),
                        //                   borderRadius: BorderRadius.circular(16),
                        //                 ),
                        //                 child: Padding(
                        //                   padding: const EdgeInsets.all(16.0),
                        //                   child: Image.asset('assets/images/pants.png', fit: BoxFit.fill),
                        //                 ),
                        //               ),
                        //               SizedBox(height: 5),
                        //               Text("Pants"),
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: TextButton(
                            onPressed: () {
                              // if (taskTitle.isNotEmpty & discreption.isNotEmpty & image.isNotEmpty & type.isNotEmpty) {

                              Provider.of<TasksData>(context, listen: false).addTask(taskTitle, discreption, _base64String, price, size, type, TB);

                              // Navigator.of(context).push(new MaterialPageRoute(builder: (_) => new HomeScreen()));
                              Navigator.pop(context);
                              // }
                            },
                            child: const Text(
                              'Add',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // TextButton(
                        //   onPressed: () {
                        //     _getFromGallery();
                        //   },
                        //   child: const Text(
                        //     'Add image',
                        //     style: TextStyle(color: Colors.white),
                        //   ),
                        //   style: TextButton.styleFrom(backgroundColor: Colors.green),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
