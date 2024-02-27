import 'package:flutter/material.dart';
import 'package:animated_pie_chart/animated_pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Animated Pie Chart and List'),
          ),
          body: SfCircularChart(
            series: [
              PieSeries<ChartData, String>(
                // dataLabelSettings: ChartDataLabelSettings(isVisible: true),
                dataSource: [
                  ChartData('Data 1', 50, color: Colors.red),
                  ChartData('Data 2', 30, color: Colors.blue),
                ],
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                // borderColor: Colors.transparent, // Set to remove divider
                // borderWidth: 0, // Set to 0 to remove divider
              ),
            ],
          )),
    );
  }

  List<MdPieChart> pieChartList = [
    MdPieChart(value: 10, name: 'Apple'),
    MdPieChart(value: 5, name: 'Peach'),
    MdPieChart(value: 15, name: 'Mango'),
    MdPieChart(value: 20, name: 'Banana'),
    MdPieChart(value: 2, name: 'Peach'),
    MdPieChart(value: 8, name: 'Guava'),
    MdPieChart(value: 12, name: 'Lemon'),
    MdPieChart(value: 14, name: 'pineApple'),
    MdPieChart(value: 6, name: 'kiwi'),
    MdPieChart(value: 8, name: 'pear'),
  ];
}

class ChartData {
  final String x;
  final double y;
  final Color color;

  ChartData(this.x, this.y, {this.color = Colors.black});
}
