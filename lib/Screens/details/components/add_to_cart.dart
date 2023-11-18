import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:e_commerce/models/task.dart';
import 'package:e_commerce/models/tasks_data.dart';
// import 'package:todospring/models/Product.dart';

import '../../../constants.dart';
import '../../Comments.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class AddToCart extends StatefulWidget {
  final String name;
  final Task task;
  const AddToCart({Key? key, required this.task, required this.name}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<TasksData>(context, listen: false);

    return ChangeNotifierProvider<TasksData>(
        create: (_) => TasksData(),
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: kDefaultPaddin),
                  height: 50,
                  width: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: Color.fromARGB(widget.task.col.alpha - 50, widget.task.col.red, widget.task.col.green, widget.task.col.blue),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.message,
                      color: Color.fromARGB(widget.task.col.alpha - 50, widget.task.col.red, widget.task.col.green, widget.task.col.blue),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Comments(name: widget.name, idP: widget.task.id.toString()),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                      color: Color.fromARGB(widget.task.col.alpha - 50, widget.task.col.red, widget.task.col.green, widget.task.col.blue),
                      onPressed: () {
                        //
                        // print(dataProvider.data + widget.task.TB);
                        Provider.of<TasksData>(context, listen: false).updateTask(widget.task, dataProvider.data);
                        dataProvider.d();
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("the transaction was"),
                                // Retrieve the text which the user has entered by
                                // using the TextEditingController.
                                content: Text(
                                  "secsfull",
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                ),
                                actions: <Widget>[
                                  new   MaterialButton(
                                    child: new Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      },
                      child: Text(
                        "Buy  Now".toUpperCase(),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
