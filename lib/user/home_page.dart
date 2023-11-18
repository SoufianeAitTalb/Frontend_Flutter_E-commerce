import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:e_commerce/Screens/Comments.dart';
import 'package:e_commerce/models/comments.dart';
import 'package:e_commerce/models/task.dart';
import 'package:charts_common/common.dart' as common show Color;

class HomePage extends StatelessWidget {
  late List<Task> coms;
  HomePage({Key? key, required this.coms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Task, String>> series = [
      charts.Series(
        id: "financial",
        data: coms,
        domainFn: (Task series, _) => series.title,
        measureFn: (Task series, _) => series.tb,
        colorFn: (Task series, _) => common.Color(r: series.col.red, g: series.col.green, b: series.col.blue, a: series.col.alpha),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bar Chart"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: charts.BarChart(
          series,
          animate: true,
        ),
      ),
    );
  }
}
