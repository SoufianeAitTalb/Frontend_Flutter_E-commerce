import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:e_commerce/models/task.dart';
import 'package:e_commerce/models/tasks_data.dart';

import '../../../constants.dart';

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<TasksData>(context);
    return ChangeNotifierProvider(
        create: (_) => TasksData(),
        builder: (context, child) {
          return Row(
            children: <Widget>[
              buildOutlineButton(
                icon: Icons.remove,
                press: () {
                  if (dataProvider.data > 1) {
                    setState(() {
                      dataProvider.Ddata();
                    });
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
                child: Text(
                  // if our item is less  then 10 then  it shows 01 02 like that
                  dataProvider.data.toString().padLeft(2, "0"),
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              buildOutlineButton(
                  icon: Icons.add,
                  press: () {
                    setState(() {
                      dataProvider.incrementData();
                    });
                  }),
            ],
          );
        });
  }

  SizedBox buildOutlineButton({required IconData icon, required VoidCallback press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
