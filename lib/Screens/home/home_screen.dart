import 'package:flutter/material.dart' hide Action;
import 'package:flutter_svg/svg.dart';
import 'package:e_commerce/Screens/home/components/bo.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/user/log.dart';

class HomeScreenn extends StatelessWidget {
  final String Name;

  const HomeScreenn({Key? key, required this.Name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Bo(Name: Name),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[
            Color.fromRGBO(49, 62, 130, 1),
            Color.fromRGBO(34, 192, 195, 1),
          ]),
        ),
      ),
      elevation: 15,
      shadowColor: Color.fromRGBO(34, 192, 195, 1),
      // leading: IconButton(
      //   icon: SvgPicture.asset("assets/icons/back.svg"),
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => const HomeScreen()),
      //     );
      //   },
      // ),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Logo.png',
            scale: 19,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'VendLux',
            style: TextStyle(color: Colors.black), //<-- SEE HERE
          ),
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            Navigator.pushAndRemoveUntil<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => log(),
              ),
              (route) => false, //if you want to disable back feature set to false
            );
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
