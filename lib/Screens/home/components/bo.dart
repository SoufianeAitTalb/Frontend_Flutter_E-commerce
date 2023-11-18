import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/Screens/details/details_screen.dart';

import 'package:e_commerce/Services/database_services.dart';
import 'package:e_commerce/constants.dart';
// import 'package:todospring/models/Product.dart';
import 'package:e_commerce/models/task.dart';

import 'package:e_commerce/models/tasks_data.dart';

import 'item_card.dart';

class Bo extends StatefulWidget {
  final String Name;

  const Bo({Key? key, required this.Name}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Bo> {
  List<Task>? tasks;
  String _type = 'ALL';
  getTasks() async {
    tasks = await DatabaseServices.getTasks();
    Provider.of<TasksData>(context, listen: false).tasks = tasks!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return tasks == null
        ? const Scaffold(
            backgroundColor: Color.fromRGBO(31, 44, 52, 1),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            color: Color.fromRGBO(31, 44, 52, 1),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(right: 0),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _type = "ALL";
                              print(_type);
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: _type == 'ALL' ? Color.fromRGBO(34, 192, 195, 1) : Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Icon(
                                    Icons.shopping_cart,
                                    size: 40,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "ALL",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _type = "Watch";
                              print(_type);
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: _type == 'Watch' ? Color.fromRGBO(34, 192, 195, 1) : Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Icon(Icons.watch),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("Watch", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _type = "Purse";
                              print(_type);
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: _type == 'Purse' ? Color.fromRGBO(34, 192, 195, 1) : Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Image.asset('assets/images/bag.png', fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("Purse", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _type = "Shoes";
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: _type == 'Shoes' ? Color.fromRGBO(34, 192, 195, 1) : Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Image.asset('assets/images/shoe.png', fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("Shoes", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _type = "T-Shirt";
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: _type == 'T-Shirt' ? Color.fromRGBO(34, 192, 195, 1) : Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Image.asset('assets/images/T-shirt.png', fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("T-Shirt", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _type = "Pants";
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: _type == 'Pants' ? Color.fromRGBO(34, 192, 195, 1) : Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Image.asset('assets/images/pants.png', fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("Pants", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                      child: Consumer<TasksData>(builder: (context, tasksData, child) {
                        return GridView.builder(
                            physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                            itemCount: _type != 'ALL' ? tasksData.tasks.where((task) => task.type == _type).length : tasksData.tasks.length,
                            // products.where((product) => product.tag == 'chicken').length
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: kDefaultPaddin,
                              crossAxisSpacing: kDefaultPaddin,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (context, index) {
                              //! this alhamdo lil ALLAH
                              Task task = _type != 'ALL' ? tasksData.tasks.where((task) => task.type == _type).toList()[index] : tasksData.tasks[index];

                              return ItemCard(
                                task: task,
                                press: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(task: task, name: widget.Name),
                                  ),
                                ),
                              );
                            });
                      })
                      // child: GridView.builder(
                      //   itemCount: tasksData.tasks.length,
                      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 2,
                      //     mainAxisSpacing: kDefaultPaddin,
                      //     crossAxisSpacing: kDefaultPaddin,
                      //     childAspectRatio: 0.75,
                      //   ),
                      //   itemBuilder: (context, index) => ItemCard(
                      //     product: products[index],
                      //     press: () => Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => DetailsScreen(
                      //           product: products[index],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      ),
                ),
              ],
            ),
          );
  }
}
