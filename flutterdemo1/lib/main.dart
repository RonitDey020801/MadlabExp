import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutterdemo1/developer_charts.dart';
import 'package:flutterdemo1/developer_series.dart';
import 'developer_series.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<DeveloperSeries> data = [
    DeveloperSeries(
        year: '2017',
        developers: 50000,
        barColor: charts.ColorUtil.fromDartColor(Colors.green)),
    DeveloperSeries(
        year: '2018',
        developers: 60000,
        barColor: charts.ColorUtil.fromDartColor(Colors.green)),
    DeveloperSeries(
        year: '2019',
        developers: 70000,
        barColor: charts.ColorUtil.fromDartColor(Colors.green)),
    DeveloperSeries(
        year: '2020',
        developers: 80000,
        barColor: charts.ColorUtil.fromDartColor(Colors.green)),
    DeveloperSeries(
        year: '2021',
        developers: 40000,
        barColor: charts.ColorUtil.fromDartColor(Colors.green)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DeveloperChart(data: data),
      ),
    );
  }
}
