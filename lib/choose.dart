import 'package:flutter/material.dart';
import 'package:e_commerce/Screens/home_screen.dart';
import 'package:e_commerce/user/log.dart';

class Choose extends StatefulWidget {
  const Choose({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 192, 195, 1),
      appBar: AppBar(
        // shadowColor: Color.fromRGBO(34, 192, 195, 1),
        elevation: 0,
        title: Text(
          "Choose",
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[
              Color.fromRGBO(49, 62, 130, 1),
              Color.fromRGBO(34, 192, 195, 1),
            ]),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // color: Color.fromRGBO(150, 28, 139, 1),
          color: Color.fromRGBO(31, 44, 52, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 255,
              ),
              ElevatedButton(
                  child: const Text("User"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => log(),
                      ),
                    );
                  }),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  child: const Text("Supplier"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
