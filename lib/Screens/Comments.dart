import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/Screens/COMTILE.dart';
import 'package:e_commerce/Services/database_services.dart';
import 'package:e_commerce/models/comments.dart';
import 'package:e_commerce/models/comments_data.dart';

class Comments extends StatefulWidget {
  final String name;
  final String idP;

  const Comments({Key? key, required this.name, required this.idP}) : super(key: key);
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  Future<List<Com>>? _comsFuture;

  String _commm = '';

  @override
  void initState() {
    super.initState();
    _comsFuture = DatabaseServices.getCom();
  }

  Future<void> _refresh() async {
    setState(() {
      _comsFuture = DatabaseServices.getCom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommentData>(
      create: (_) => CommentData(),
      child: FutureBuilder<List<Com>>(
        future: _comsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasData) {
            final coms = snapshot.data;
            Provider.of<CommentData>(context, listen: false).Coms = coms!;
            return Scaffold(
              backgroundColor: Color.fromRGBO(31, 44, 52, 1),
              appBar: AppBar(
                title: Text(
                  '${coms.where((task) => task.idP == widget.idP).length} Comments',
                ),
                centerTitle: true,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(49, 62, 130, 1),
                        Color.fromRGBO(34, 192, 195, 1),
                      ],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight,
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                ),
              ),
              body: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Consumer<CommentData>(
                      builder: (context, commentData, child) {
                        return RefreshIndicator(
                          onRefresh: _refresh,
                          child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                            itemCount: commentData.Coms.where((task) => task.idP == widget.idP).length,
                            //  commentData.Coms.length,
                            itemBuilder: (context, index) {
                              final com = commentData.Coms.where((task) => task.idP == widget.idP).toList()[index];
                              return COMTILE(com: com, commentData: commentData);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(bottom: 15, left: 15),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 340,
                          height: 60,
                          child: TextFormField(
                            style: TextStyle(color: Colors.pinkAccent),
                            key: ValueKey('comments'),
                            autocorrect: true,
                            textCapitalization: TextCapitalization.words,
                            enableSuggestions: false,
                            // validator: (value) {
                            //   if (value!.isEmpty || value.length < 4) {
                            //     return 'Please enter at least 4 characters';
                            //   }
                            //   return null;
                            // },
                            decoration: InputDecoration(
                              labelText: 'Your comment',
                              labelStyle: TextStyle(
                                color: Colors.white, //<-- SEE HERE
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(37, 76, 135, 1),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(37, 76, 135, 1),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              _commm = value;
                            },
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Provider.of<CommentData>(context, listen: false).addTask(_commm, widget.name, widget.idP);
                            },
                            icon: Icon(
                              Icons.send,
                              color: Colors.blue,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            );
          } else
            return Scaffold();
        },
      ),
    );
  }
}
